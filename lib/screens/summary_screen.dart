import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:craftrip_app/models/weather.dart'; //import WeatherData

class Summary extends StatefulWidget {

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {

  WeatherData weather;

  @override
  void initState() {
    super.initState();

    loadCurrentTemp('London');
  }

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        title: 'Flutter Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(    //APP BAR
            preferredSize:Size.fromHeight(65.0) ,
            child: AppBar(
              backgroundColor: Color(0xff2675eb),
              title: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'SUMMARY',
                        style: TextStyle(
                            fontSize: 28.0,
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
                          //height: MediaQuery.of(context).size.height * 0.08,
                          //width: MediaQuery.of(context).size.width * 0.18, // fixed width and height
                          child: Image.asset('assets/TravelDiaryIcon.png'),
                        ),
                        Text('CrafTrip',
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          //END OF APP BAR

          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('SINGAPORE\t\t\t', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500, letterSpacing: 1.5)), //Location 1
                    Icon(Icons.flight_takeoff),
                    Text('\t\t\tLONDON', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500, letterSpacing: 1.5)), //Location 2
                  ],
                ),
              ),

              //CURRENCY CARD

              SizedBox(
                height: 145,
                width: 362,
                child: Center(
                  child: Card(
                      color: Colors.grey[200],
                      elevation: 0.0,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 50.0),
                                Text('CURRENCY EXCHANGE', style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    letterSpacing: 0.3),
                                  textAlign: TextAlign.center,),
                                SizedBox(width:35.0),
                                CircleAvatar(backgroundColor: Colors.grey[900], minRadius: 2.0,child: Icon(Icons.more_horiz, color: Colors.white)),
                              ],
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:[
                                Container( //Box
                                  height: 50.0 ,
                                  width: 70.0,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid)
                                  ),
                                  child: Center(child: Text('1.00', style: TextStyle(fontSize: 17.0))),
                                ),
                                Text('=',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 40.0,
                                        color: Colors.black
                                    )),
                                Container( //Box
                                  height: 50.0,
                                  width: 70.0,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid)
                                  ),
                                  child: Center(child: Text('51.20', style: TextStyle(fontSize: 17.0))),
                                )
                              ]
                          ),
                          SizedBox(height:8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('SGD', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700)),
                              SizedBox(width: 160.0,),
                              Text('EUR', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700))
                            ],
                          ),
                        ],
                      )
                  ),
                ),
              ),
              SizedBox(height:6.0),

              // FLIGHT PRICES CARD

              SizedBox(
                height: 150,
                width: 362,
                child: Center(
                  child: Card(
                      color: Colors.grey[200],
                      elevation: 0.0,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 100.0),
                                Text('FLIGHT PRICES', style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    letterSpacing: 0.3),
                                  textAlign: TextAlign.center,),
                                SizedBox(width:65.0),
                                CircleAvatar(backgroundColor: Colors.grey[900], minRadius: 2.0,child: Icon(Icons.more_horiz, color: Colors.white)),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(child: Image.asset('assets/singapore.png', height: 50.4, width: 67.2)), //airline image 1
                              SizedBox(width:85.0),
                              Center(child: Image.asset('assets/british.png', height: 50.4, width: 67.2)), //airline image 2
                            ],
                          ),
                          Row( //assets/Screenshot 2020-03-19 at 4.25.26 PM.png
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:[
                                Container( //Box
                                  height: 45.0 ,
                                  width: 90.0,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid)
                                  ),
                                  child: Center(child: Text('SGD 231', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700))),
                                ),
                                Container( //Box
                                  height: 45.0,
                                  width: 90.0,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid)
                                  ),
                                  child: Center(child: Text('SGD 443', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700))),
                                )
                              ]
                          ),
                        ],
                      )
                  ),
                ),
              ),
              SizedBox(height: 1.0),

              //WEATHER CARD

              Center(
                child: SizedBox(
                  height: 154,
                  width: 370,
                  child: Card(
                    elevation: 0.0,
                    color: Colors.grey[200],
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 125.0),
                              Text('WEATHER', style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  letterSpacing: 0.3),
                                textAlign: TextAlign.center,),
                              SizedBox(width:80.0),
                              CircleAvatar(backgroundColor: Colors.grey[900], minRadius: 2.0,child: Icon(Icons.more_horiz, color: Colors.white)),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network('https://openweathermap.org/img/w/${weather.icon}.png'),
                            SizedBox(width: 10.0),
                            Text(
                              '${weather.todayTemp.toString()}°C', //display current air temp
                              style: TextStyle(
                                fontSize: 38.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),),
                          ],),
                        Center(
                          child: Text(
                            'MAX ${weather.todayMax.toString()}°C | MIN ${weather.todayMin.toString()}°C', //display max and min air temp
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              letterSpacing: 1.5,
                            ),),
                        ),
                        SizedBox(height:3.0),
                        Center(
                          child: Text(
                            'Humidity: ${weather.todayHumidity.toString()}%', //display current air temp
                            style: TextStyle(
                              fontSize: 14.0,
                              letterSpacing: 1.5,
                              color: Colors.black,
                            ),),
                        ),
                      ],
                    ),
                  ), //Card
                ),
              ),
            ],
          ),

          //BOTTOM NAVIGATION BAR
          bottomNavigationBar: SizedBox(
            height: 70.0,
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
                      icon: Icon(Icons.history, size: 40.0,),
                      title: Text(""),
                    ),
                    new BottomNavigationBarItem(
                      icon: Icon(Icons.beenhere, size: 35.0,),
                      title: Text(""),
                    ),
                    new BottomNavigationBarItem(
                      icon: Icon(Icons.favorite, size: 35.0,),
                      title: Text(""),
                    )
                  ],
                )),
          ),
        ),
      );
  }

//contains function to display current weather info for that location

  loadCurrentTemp(String cityName) async //use city name to get info for that location
      {
    final weatherResponse = await http.get('http://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=a8136c5ebc2116d2baa9ad9eaa3b054e');

    if (weatherResponse.statusCode == 200)
    {
      weather = new WeatherData.fromJson(jsonDecode(weatherResponse.body));
      print(weather.todayTemp);
      return weather.todayTemp;
    }
  }
}

