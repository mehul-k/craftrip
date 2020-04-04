import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:craftrip_app/models/weather.dart';

//Template for current weather card
class WeatherCard extends StatelessWidget {
  final WeatherData weather;
  WeatherCard({Key key, @required this.weather}): super(key: key);

  @override
  Widget build(BuildContext context) {                  
    
    return SizedBox(
      height: 160,
      width: 250,
      
      child: Card(
        elevation: 3.5,
        margin: EdgeInsets.all(10.0),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0,0.0, 0.0),
              child: Text(
                'TODAY',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: <Widget>[
                Image.network('https://openweathermap.org/img/w/${weather.icon}.png'), //display weather icon
                
                SizedBox(width: 10.0),
                
                Text(
                  '${weather.todayTemp.toString()}°C', //display current air temp
                  style: TextStyle(
                    fontSize: 38.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            
            Center(
              child: Text(
                'MAX ${weather.todayMax.toString()}°C | MIN ${weather.todayMin.toString()}°C', //display max and min air temp
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            
            SizedBox(height:3.0),
            
            Center(
              //display current humidity temp
              child: Text(
                'Humidity: ${weather.todayHumidity.toString()}%', 
                style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 1.5,
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height:6.0),
          ],
        ),
      ),
    );
  }
}
