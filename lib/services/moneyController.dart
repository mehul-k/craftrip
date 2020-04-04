import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

import 'package:craftrip_app/models/PeriodicExchange.dart';
import 'package:craftrip_app/models/TodayCurrency.dart';

class MoneyManager {

  List<PeriodicExchange> periodicCurrency;
  Future<TodayCurrency> currencyData;
  Future<PeriodicExchange> periodicData;

  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  Future<double> loadCurrency(String currencyName) async {
    
    TodayCurrency todayCurrency;

    final currencyResponse = await http.get(
      'https://api.exchangeratesapi.io/latest?base=SGD&symbols=$currencyName');

    if (currencyResponse.statusCode == 200) {
      todayCurrency = TodayCurrency.fromJson(
        json.decode(currencyResponse.body), currencyName);
      //print(todayCurrency.value);
      
      return todayCurrency.value;
    }
  }

  Future<List<PeriodicExchange>> loadPeriodic(String currency) async {

    http.Response periodicResponse = await http.get(
      'https://api.exchangeratesapi.io/history?start_at=2020-01-01&end_at=$formattedDate&base=SGD');

    //If the server did return a 200 OK response, then parse the JSON.
    if (periodicResponse.statusCode == 200) {
      periodicCurrency = listConverter(json.decode(periodicResponse.body), '$currency');
    
      return periodicCurrency; 
    }
    //If the server did not return a 200 OK response, then throw an exception.
    else {
      throw Exception('Failed to load exchange rate');
    }
  }
}
