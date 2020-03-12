class WeatherData {

  String location; //to store location
  DateTime date; //to store date
  final int todayTemp;//to store current air temperature
  final int todayMax;//to store current max air temperature
  final int todayMin;//to store current min air temperature
  final int todayHumidity; //to store current humidity
  final String icon; //to store weather icon

  WeatherData({this.date, this.location, this.todayTemp, this.todayMax, this.todayMin, this.todayHumidity, this.icon});

  factory WeatherData.fromJson(Map<String, dynamic> json) {   //Factory used for deferring the instantiation to specific classes implementing this interface

    return WeatherData(
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: false),
      location: json['name'],
      todayTemp: json['main']['temp'].toDouble().round(),
      todayMax: json['main']['temp_max'].toDouble().round(),
      todayMin: json['main']['temp_min'].toDouble().round(),
      todayHumidity: json['main']['humidity'].toInt(),
      icon: json['weather'][0]['icon'],
    );
  }
}