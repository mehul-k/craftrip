import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:craftrip_app/models/weather.dart';

 //Template for Forecast cards
class WeatherForecast extends StatelessWidget {         

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
            //display day, time
            Padding(
              padding: const EdgeInsets.all(6.0),  
              child: SizedBox(width: 105.0, child: Text(dayAndTime, style: TextStyle(color: Colors.black, fontSize: 15.0))),
            ),
            
            //display weather icon
            Padding(
              padding: const EdgeInsets.all(6.0),   
              child: Image.network('https://openweathermap.org/img/w/${weather.icon}.png'),
            ),
            
            //display temp
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),      
              child: Text('${weather.todayTemp.toString()}°C',  style: TextStyle(color: Colors.black, fontSize: 15.0)),
            ),
            
            //display humidity
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 0.0), 
              child: Text('\t \t \t \t \t\t\t${weather.todayHumidity.toString()}%',  style: new TextStyle(color: Colors.black, fontSize: 15.0)),
            ),
          ],
        ),
      ),
    );
  }
}