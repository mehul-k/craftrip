import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'weather_card.dart';
import 'forecast_card.dart';
import 'package:craftrip_app/services/weatherController.dart';
import 'package:craftrip_app/models/weather.dart'; // import WeatherData
import 'package:craftrip_app/models/forecast.dart'; // import ForecastData

class Weather extends StatefulWidget {
  var cityName;
  Weather({@required this.cityName});

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather>
{
  Future<WeatherData> weatherData;   // Creating an instance of WeatherData
  Future<ForecastData> forecastData; // Creating an instance of ForecastData
  WeatherManager weatherManager = WeatherManager();

  @override
  // To insert object into widget tree
  void initState() {     

    super.initState();

    // Loading data
    weatherData = weatherManager.loadWeather(widget.cityName);
    forecastData = weatherManager.loadForecast(widget.cityName);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, 
        ),

        backgroundColor: Color(0xff2675eb),

        title: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 0.0),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: <Widget>[
              Text('WEATHER',
                style: TextStyle(
                  fontSize: 24.0,
                  letterSpacing: 1.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w400
                )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                    width:30.0,
                    child: Image.asset('assets/TravelDiaryIcon.png'),
                  ),

                  Text('CrafTrip',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: <Widget>[
                //Location 2
                Text('\t\t\t${widget.cityName} Weather', 
                  style: TextStyle(
                    fontSize: 25.0, 
                    fontWeight: FontWeight.w500, 
                    letterSpacing: 1.5
                  )
                ), 
              ],
            ),
          ),
          
          buildWeatherList(weatherData),
          
          SizedBox(height: 10.0),
            
          //Headings Card
          Card(                                          
            elevation: 0.3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('\t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t'),
                  Text('\t\t\t\t\tTEMPERATURE',  style: new TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w400, letterSpacing: 0.5)),
                  Text('\t\t\t\tHUMIDITY',  style: new TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w400, letterSpacing: 0.5)),
                ],
              ),
            ),
          ),
          
          buildForecastList(forecastData),
        ],
      )
    );
  }

  Widget buildForecastList(apiData) => FutureBuilder<dynamic> (
      
      future: apiData,
      builder: (context, snapshot) {

        if (!snapshot.hasData) return Container(
            height: 100,
            width: 300,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.green)
                    ),
                  ),
                ),
              ],
            )
        );

      //Forecast Cards
      return  Container(                                  
        height: 335.0,
        child: ListView.builder(
            itemCount: snapshot.data.list.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => 
              WeatherForecast(weather: snapshot.data.list.elementAt(index))
          ),
      );
    }
  );

  Widget buildWeatherList(apiData) => FutureBuilder<dynamic> (
    future: apiData,
    builder: (context, snapshot) {
      
      // Loading Indicator 
      if (!snapshot.hasData) return Container(
        height: 100,
        width: 400,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Center(
                child: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(5),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.green)
                  ),
                ),
              ),
            ],
          )
        );

        return  SizedBox(
          height: 160,
          width: 250,
          child: WeatherCard(weather: snapshot.data),     //Current Weather Top Card
        );
      }
  );
}




