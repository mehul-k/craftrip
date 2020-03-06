import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './weather_card_template.dart';
import './weather_forecast_template.dart';
import './weather.dart'; //import WeatherData
import "./forecast.dart"; //import ForecastData

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {

  //bool isLoading = false;
  WeatherData weatherData;   //creating an instance of WeatherData
  ForecastData forecastData; //creating an instance of ForecastData

  @override
  void initState() {     //to insert object into widget tree

    super.initState();
    loadWeather();       //load data
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
          SizedBox(
            height: 160,
            width: 250,
            child: WeatherCard(weather: weatherData),     //Current Weather Top Card
          ),
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
          Container(                                  //Forecast Cards
            height: 300.0,
            child: ListView.builder(
                itemCount: forecastData.list.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => WeatherForecast(weather: forecastData.list.elementAt(index))),
          ),
        ],),
      bottomNavigationBar: SizedBox(             //Bottom Navigation Bar
        height: 75.0,
        child: Theme(
            data: Theme.of(context).copyWith(  // sets the background color of the `BottomNavigationBar`
                canvasColor: Colors.black,   // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                primaryColor: Color(0xff2675eb),
                textTheme: Theme
                    .of(context)
                    .textTheme
                    .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              //onTap: onTabTapped, // new
              //currentIndex: _currentIndex, // new
              items: [
                new BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 40.0,),
                  title: Text(""),
                ),
                new BottomNavigationBarItem(
                  icon: Icon(Icons.history,
                    size: 45.0,),
                  title: Text(""),
                ),
                new BottomNavigationBarItem(
                  icon: Icon(Icons.beenhere, size: 40.0,),
                  title: Text(""),
                ),
                new BottomNavigationBarItem(
                  icon: Icon(Icons.favorite, size: 40.0,),
                  title: Text(""),
                )
              ],
            )),
      ),
    );
  }

  loadWeather() async
  {
  //setState(() {
  //isLoading = true;
  //});

    final weatherResponse = await http.get('http://api.openweathermap.org/data/2.5/weather?q=Singapore&units=metric&appid=a8136c5ebc2116d2baa9ad9eaa3b054e');
    final forecastResponse = await http.get('http://api.openweathermap.org/data/2.5/forecast?q=Singapore&units=metric&appid=a8136c5ebc2116d2baa9ad9eaa3b054e');

    if (weatherResponse.statusCode == 200 && forecastResponse.statusCode == 200)
    {
      return setState(() {
        weatherData = new WeatherData.fromJson(jsonDecode(weatherResponse.body));
        forecastData = new ForecastData.fromJson(jsonDecode(forecastResponse.body));
        //isLoading = false;
      });
    }
  }
}



