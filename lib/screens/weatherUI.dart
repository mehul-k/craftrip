import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:craftrip_app/services/weatherController.dart';

import './weather_card.dart';
import './forecast_card.dart';
import 'package:craftrip_app/models/weather.dart'; //import WeatherData
import 'package:craftrip_app/models/forecast.dart'; //import ForecastData

class Weather extends StatefulWidget {
  var cityName;
  Weather({@required this.cityName});

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather>
{
  Future<WeatherData> weatherData;   //creating an instance of WeatherData
  Future<ForecastData> forecastData; //creating an instance of ForecastData
  WeatherManager weatherManager = WeatherManager();

  @override
  void initState() {     //to insert object into widget tree

    super.initState();
    weatherData = weatherManager.loadWeather(widget.cityName);
    forecastData = weatherManager.loadForecast(widget.cityName);//load data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(                           //App Bar
          preferredSize:Size.fromHeight(65.0) ,
          child: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            backgroundColor: Color(0xff2675eb),
            title: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'WEATHER',
                      style: TextStyle(
                          fontSize: 24.0,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                        width:30.0,
                        //height: MediaQuery.of(context).size.height * 0.08,
                        //width: MediaQuery.of(context).size.width * 0.18, // fixed width and height
                        child: Image.asset('assets/TravelDiaryIcon.png'),
                      ),
                      Text('CrafTrip',
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          )),
                    ],),
                ],),
            ),
          ),),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Text('Singapore\t\t\t', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500, letterSpacing: 1.5)), //Location 1
                  //Icon(Icons.flight_takeoff),
                  Text('\t\t\t${widget.cityName} Weather', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500, letterSpacing: 1.5)), //Location 2
                  //Icon(Icons.wb_sunny),
                ],
              ),
            ),
            buildWeatherList(weatherData),
            SizedBox(height: 10.0),
            Card(                                          //Headings Card
              elevation: 0.3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('\t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t'),
                    Text('\t\t\t\t\tTEMPERATURE',  style: new TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w400, letterSpacing: 0.5)),
                    Text('\t\t\t\tHUMIDITY',  style: new TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w400, letterSpacing: 0.5)),
                  ],),
              ),),
            buildForecastList(forecastData),

          ],)
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

        if (snapshot.data.length == 0) {
          return Container(
            height: 300,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                child: Container(
                height: 200,
                width: 200,
                margin: EdgeInsets.all(5),

                child: Text("Weather Data currently unavailable!", 
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                  ),
                  textAlign: TextAlign.center),

                  ),
                ),
              ],
            )
          );
        }

        return  Container(                                  //Forecast Cards
          height: 335.0,
          child: ListView.builder(
              itemCount: snapshot.data.list.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => WeatherForecast(weather: snapshot.data.list.elementAt(index))),
        );
      }
  );

  Widget buildWeatherList(apiData) => FutureBuilder<dynamic> (
      future: apiData,
      builder: (context, snapshot) {

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

        if (snapshot.data!= null) {
          return Container(
            height: 300,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                child: Container(
                height: 200,
                width: 200,
                margin: EdgeInsets.all(5),

                child: Text("Weather Data currently unavailable!", 
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                  ),
                  textAlign: TextAlign.center),

                  ),
                ),
              ],
            )
          );
        }

        return  SizedBox(
          height: 160,
          width: 250,
          child: WeatherCard(weather: snapshot.data),     //Current Weather Top Card
        );
      }
  );

}




