
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:craftrip_app/models/weather.dart'; //import WeatherData
import 'package:craftrip_app/models/forecast.dart'; //import ForecastData

class WeatherManager
{
  String cityName;
  Future<WeatherData> weatherData;   //creating an instance of WeatherData
  Future<ForecastData> forecastData; //creating an instance of ForecastData

  loadCurrentTemp(String cityName) async  {   //use city name to get info for that location
    WeatherData weather;
    final weatherResponse = await http.get('http://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=a8136c5ebc2116d2baa9ad9eaa3b054e');

    if (weatherResponse.statusCode == 200)
    {
        return WeatherData.fromJson(jsonDecode(weatherResponse.body));
    }
    else {
        //If the server did not return a 200 OK response, then throw an exception.
        throw Exception('Failed to load current weather');
    }
  }

  Future<WeatherData> loadWeather(String cityName) async
  {
    final weatherResponse = await http.get('http://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=a8136c5ebc2116d2baa9ad9eaa3b054e');
    if (weatherResponse.statusCode == 200)
    {
      return new WeatherData.fromJson(jsonDecode(weatherResponse.body));
    }
    else {
      //If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load current weather');
    }
  }

  Future<ForecastData> loadForecast(String cityName) async
  {
    final forecastResponse = await http.get('http://api.openweathermap.org/data/2.5/forecast?q=$cityName&units=metric&appid=a8136c5ebc2116d2baa9ad9eaa3b054e');

    if (forecastResponse.statusCode == 200)
    {
      return new ForecastData.fromJson(jsonDecode(forecastResponse.body));
    }
    else {
      //If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load current weather forecast');
    }
  }
}

