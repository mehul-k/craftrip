import 'package:craftrip_app/services/flightsController.dart';
import 'package:craftrip_app/services/moneyController.dart';
import 'package:craftrip_app/screens/exchange_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:craftrip_app/models/weather.dart';
import 'package:craftrip_app/models/destination.dart';
import 'package:flutter/cupertino.dart';
import 'weatherUI.dart';//import WeatherData
import 'package:craftrip_app/screens/startFlights_screen.dart';
import 'package:intl/intl.dart';
import 'package:craftrip_app/services/weatherController.dart';

class Summary extends StatefulWidget {

  Destination travelDestination;

  Summary({@required this.travelDestination});

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {

  Future<WeatherData> weather;
  Future<double> exchangeRate;
  Future<double> minFlightPrice;

  @override
  void initState() {
    super.initState();

    weather = WeatherManager().loadWeather('${widget.travelDestination.city}');
    exchangeRate = MoneyManager().loadCurrency(widget.travelDestination.currency);
    minFlightPrice = FlightsManager().loadFlights(widget.travelDestination.cityID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(    //APP BAR
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
                    'SUMMARY',
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
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Singapore\t\t\t', style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w500, letterSpacing: 1.5)), //Location 1
                Icon(Icons.flight_takeoff),
                Text('\t\t\t${widget.travelDestination.city}', style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w500, letterSpacing: 1.5)), //Location 2
              ],
            ),
          ),

          //CURRENCY CARD

          buildCurrencyCard(exchangeRate),
          SizedBox(height:12.0),

          // FLIGHT PRICES CARD

          buildFlightsCard(minFlightPrice),
          SizedBox(height:8.0),

          buildWeatherCard(weather),//WEATHER CARD


        ],
      ),
      //BOTTOM NAVIGATION BAR
    );
  }

  Widget buildWeatherCard(apiData) => FutureBuilder<dynamic> (
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


        return Center(
          child: SizedBox(
            height: 168,
            width: 400,
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
                        SizedBox(width: 145.0),
                        Text('WEATHER', style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            letterSpacing: 0.3),
                          textAlign: TextAlign.center,),
                        SizedBox(width:95.0),
                        InkWell(onTap: () {Navigator.push(context, CupertinoPageRoute(builder: (context) => Weather(cityName: snapshot.data.location)));}
                            ,
                            child: CircleAvatar(backgroundColor: Colors.grey[900], minRadius: 2.0,child: Icon(Icons.more_horiz, color: Colors.white,))),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network('https://openweathermap.org/img/w/${snapshot.data.icon}.png'),
                      SizedBox(width: 10.0),
                      Text(
                        '${snapshot.data.todayTemp.toString()}°C', //display current air temp
                        style: TextStyle(
                          fontSize: 38.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],),
                  Center(
                    child: Text(
                      'MAX ${snapshot.data.todayMax.toString()}°C | MIN ${snapshot.data.todayMin.toString()}°C', //display max and min air temp
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        letterSpacing: 1.5,
                      ),),
                  ),
                  SizedBox(height:3.0),
                  Center(
                    child: Text(
                      'Humidity: ${snapshot.data.todayHumidity.toString()}%', //display current air temp
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
        );
      }
  );

  Widget buildCurrencyCard(apiData) => FutureBuilder<dynamic> (
      future: apiData,
      builder: (context, snapshot) {

        if (!snapshot.hasData) return Container(

            height: 100,
            width: 80,

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
          width: 392,
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
                          SizedBox(width: 80.0),
                          Text('CURRENCY EXCHANGE', style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              letterSpacing: 0.3),
                            textAlign: TextAlign.center,),
                          SizedBox(width:35.0),
                          InkWell(onTap: () {Navigator.push(context, CupertinoPageRoute(builder: (context) => ExchangeScreen(currency: widget.travelDestination.currency)));}
                              ,
                              child: CircleAvatar(backgroundColor: Colors.grey[900], minRadius: 2.0,child: Icon(Icons.more_horiz, color: Colors.white,))),
                        ],
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          Container( //Box
                            height: 50.0 ,
                            width: 100.0,
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
                            width: 100.0,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid)
                            ),
                            child: Center(child: Text('${snapshot.data}', style: TextStyle(fontSize: 17.0))),
                          )
                        ]
                    ),
                    SizedBox(height:8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('SGD', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700)),
                        SizedBox(width: 160.0,),
                        Text('${widget.travelDestination.currency}', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700))
                      ],
                    ),
                  ],
                )
            ),
          ),
        );
      }
  );

  Widget buildFlightsCard(apiData) => FutureBuilder<dynamic> (
      future: apiData,
      builder: (context, snapshot) {

        if (!snapshot.hasData) return Container(

            height: 100,
            width: 80,

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

        DateTime currDate = new DateTime.now().add(new Duration(days: 1));

        String depDate = new DateFormat("yyyy-MM-dd").format(currDate);

        return  SizedBox(
          height: 160,
          width: 392,
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
                          SizedBox(width: 115.0),
                          Text('FLIGHT PRICES', style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              letterSpacing: 0.3),
                            textAlign: TextAlign.center,),
                          SizedBox(width:80.0),
                          InkWell(onTap: () {Navigator.push(context, CupertinoPageRoute(builder: (context) => StartFlightsPage(cityId: widget.travelDestination.cityID)));}
                              ,
                              child: CircleAvatar(backgroundColor: Colors.grey[900], minRadius: 2.0,child: Icon(Icons.more_horiz, color: Colors.white,))) ],
                      ),
                    ),
                    Text('Date: $depDate', style: TextStyle(
                        fontSize: 17
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Image.asset('assets/singapore.png', height: 50.4, width: 67.2)),
                        SizedBox(
                          width: 10,
                        ),
                        Container( //Box
                          height: 45.0 ,
                          width: 90.0,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid)
                          ),
                          child: Center(child: Text('${snapshot.data}', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700))),
                        )//airline image 1//airline image 2
                      ],
                    ),

                  ],
                )
            ),
          ),
        );
      }
  );
}

