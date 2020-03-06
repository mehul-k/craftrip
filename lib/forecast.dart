import './weather.dart';

class ForecastData {
  final List list;

  ForecastData({this.list});

  factory ForecastData.fromJson(Map<String, dynamic> json) {      //parse json file (converted to a Map)
    List list = new List();

    for (dynamic e in json['list']) {
      WeatherData w = new WeatherData(
        date: new DateTime.fromMillisecondsSinceEpoch(e['dt'] * 1000, isUtc: false),
        location: json['city']['name'],
        todayTemp: e['main']['temp'].toDouble().round(),
        todayMax: e['main']['temp_max'].toDouble().round(),
        todayMin: e['main']['temp_min'].toDouble().round(),
        todayHumidity: e['main']['humidity'].toInt(),
        icon: e['weather'][0]['icon'],
      );
      list.add(w);
    }

    return ForecastData(
      list: list,
    );
  }
}