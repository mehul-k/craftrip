import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

class _WeatherState extends State<Weather> {

  //bool isLoading = false;
  Future<WeatherData> weatherData;   //creating an instance of WeatherData
  Future<ForecastData> forecastData; //creating an instance of ForecastData

  @override
  void initState() {     //to insert object into widget tree

    super.initState();
    weatherData = loadWeather(widget.cityName);
    forecastData = loadForecast(widget.cityName);//load data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(                           //App Bar
        preferredSize:Size.fromHeight(65.0) ,
        child: AppBar(
          backgroundColor: Color(0xff2675eb),
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                    'WEATHER',
                    style: TextStyle(
                        fontSize: 28.0,
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
          SizedBox(height: 6.0),
          buildWeatherList(weatherData),
          SizedBox(height: 10.0),
          Card(                                          //Headings Card
            elevation: 0.3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('\t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t'),
                  Text('\t\t\t\tTEMPERATURE',  style: new TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w400, letterSpacing: 0.5)),
                  Text('HUMIDITY',  style: new TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w400, letterSpacing: 0.5)),
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

        return  Container(                                  //Forecast Cards
          height: 300.0,
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

        return  SizedBox(
          height: 160,
          width: 250,
          child: WeatherCard(weather: snapshot.data),     //Current Weather Top Card
        );
      }
  );


  Future<WeatherData>loadWeather(String cityName) async
  {
    //setState(() {
    //isLoading = true;
    //});

    final weatherResponse = await http.get('http://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=a8136c5ebc2116d2baa9ad9eaa3b054e');
    if (weatherResponse.statusCode == 200)
    {
      return new WeatherData.fromJson(jsonDecode(weatherResponse.body));
         //isLoading = false;
    }
  }

  Future<ForecastData>loadForecast(String cityName) async
  {
    //setState(() {
    //isLoading = true;
    //});

   final forecastResponse = await http.get('http://api.openweathermap.org/data/2.5/forecast?q=$cityName&units=metric&appid=a8136c5ebc2116d2baa9ad9eaa3b054e');

    if (forecastResponse.statusCode == 200)
    {
      return new ForecastData.fromJson(jsonDecode(forecastResponse.body));
      //isLoading = false;
    }
  }




}



