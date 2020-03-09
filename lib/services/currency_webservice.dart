import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:craftrip_app/model/currency_exchange.dart';
import 'dart:convert';
import 'dart:async';

class CurrencyWebService {

  CurrencyExchange exchangedata;

  Future<CurrencyExchange> fetchCurrency() async {

    final currencyResponse = 
        await http.get('https://eservices.mas.gov.sg/api/action/datastore/search.json?resource_id=95932927-c8bc-4e7a-b484-68a66a24edfe&limit=5');
  
    if(currencyResponse.statusCode == 200){
      //If the server did return a 200 OK response, then parse the JSON.
      return CurrencyExchange.fromJson(json.decode(currencyResponse.body));
    } else{
      //If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load exchange rate');
    }
  
  }
  
}



















