import 'package:flutter/material.dart';
import 'package:craftrip_app/models/weather.dart';
import 'package:intl/intl.dart';


class WeatherForecast extends StatelessWidget {          //Template for Forecast cards

  final WeatherData weather;
  WeatherForecast({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dayAndTime = DateFormat('EEEE').format(weather.date).toString().substring(0,3) + ", " + DateFormat.jm().format(weather.date).toString(); //add first 3 letters of day and time of the day
    return Card(
      elevation: 0.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6.0),  //display day, time
              child: SizedBox(width: 105.0, child: Text(dayAndTime, style: TextStyle(color: Colors.black, fontSize: 15.0))),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),   //display weather icon
              child: Image.network('https://openweathermap.org/img/w/${weather.icon}.png'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),      //display temp
              child: Text('${weather.todayTemp.toString()}°C',  style: TextStyle(color: Colors.black, fontSize: 15.0)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 0.0), //display humidity
              child: Text('\t \t \t \t \t\t\t${weather.todayHumidity.toString()}%',  style: new TextStyle(color: Colors.black, fontSize: 15.0)),
            ),
          ],
        ),
      ),
    );
  }
}