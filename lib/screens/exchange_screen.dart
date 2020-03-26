import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
//import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:craftrip_app/models/PeriodicExchange.dart';
import 'package:craftrip_app/models/TodayCurrency.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
//import 'package:cloud_firestore/cloud_firestore.dart';


class ExchangeScreen extends StatefulWidget{

  var currency;

  ExchangeScreen({@required this.currency});

  loadCurrency(String currencyName) async{

    final currencyResponse = await http.get('https://api.exchangeratesapi.io/latest?base=SGD&symbols=$currencyName');


    if(currencyResponse.statusCode == 200)
    {
      TodayCurrency todayCurrency = new TodayCurrency.fromJson(json.decode(currencyResponse.body), currencyName);
      //print(todayCurrency.value);
      return todayCurrency.value;
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _ExchangeScreenState();
  }

}

class _ExchangeScreenState extends State<ExchangeScreen>{

  Future<dynamic> fetch;

  List<PeriodicExchange> periodicCurrency;

  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  fetchCurrency() async {

    http.Response periodicResponse = 
        await http.get('https://api.exchangeratesapi.io/history?start_at=2020-01-01&end_at=$formattedDate&base=SGD');

    if(periodicResponse.statusCode == 200){
      //If the server did return a 200 OK response, then parse the JSON.
      
      //print(currencyResponse.body);
      //loadCurrency('USD');
      
      return setState((){
        periodicCurrency = listConverter(json.decode(periodicResponse.body), '${widget.currency}');
      });
    }
    else{
      //If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load exchange rate');
    }
  
  }

  @override
  void initState(){
    super.initState();
    fetch = fetchCurrency();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(65.0),
        
        child: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back), 
            onPressed: () => Navigator.pop(context, false),
            iconSize: 20.0,
            color: Colors.white
            ),
          backgroundColor: Color(0xff2675eb),
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('CURRENCY EXCHANGE',
                style: TextStyle(
                  fontSize: 24.0,
                  letterSpacing: 1.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w400)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                      width: 30.0,
                      child: Image.asset('assets/TravelDiaryIcon.png'),
                    ),
                  Text('CrafTrip',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 13.0,
                      color: Colors.white))
                  ],
                ),
              ],
            )
          ),
        )
      ),


    body: Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10.0),
        alignment: Alignment(1.0,3.0),
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Padding(
                  padding:EdgeInsets.fromLTRB(35.0,0.0,50.0,0.0),
                  child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(
                      title: AxisTitle(
                        text: 'DATE'
                      )
                    ),
                    primaryYAxis: NumericAxis(
                      title: AxisTitle(
                        text: 'CURRENCY RATE'
                      )
                    ),
                    legend: Legend(isVisible: false),
                    tooltipBehavior: TooltipBehavior(enable:true),
                    series: <LineSeries<PeriodicExchange,DateTime>>[
                      LineSeries<PeriodicExchange, DateTime>(
                        dataSource: periodicCurrency,
                        xValueMapper: (PeriodicExchange exchange, _) => exchange.date,
                        yValueMapper: (PeriodicExchange exchange, _) => exchange.value,
                        dataLabelSettings: DataLabelSettings(isVisible: true)
                       )
                    ]
                  )
                ),

              ],
              ),

              Spacer(),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Container( //Box
                    height: 60.0 ,
                    width: 120.0,
                    padding: EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid)),
                    alignment: Alignment.center,
                    child: FutureBuilder<dynamic>(
                      future: loadCurrency('SGD'),
                      builder: (BuildContext context, AsyncSnapshot<dynamic>snapshot){
                        if(snapshot.hasData){
                          return Text(snapshot.data.toString(), 
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              letterSpacing: 1.5
                            ),
                            textAlign: TextAlign.center,
                          );
                        }
                        else if(snapshot.hasError){
                          return Text("-");
                        }
                        return CircularProgressIndicator();
                      }
                    )
                  ),

                  Text('=', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.black
                  )),

                  Container( //Box
                    height: 60.0,
                    width: 120.0,
                    padding: EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid)
                    ),
                    alignment: Alignment.center,
                    child: FutureBuilder<dynamic>(
                      future: loadCurrency('${widget.currency}'),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return Text(snapshot.data.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            letterSpacing: 1.5
                          ),
                          textAlign: TextAlign.center
                          );
                        }
                        else if(snapshot.hasError){
                          return Text("-");
                        }
                        return CircularProgressIndicator();
                      }
                    )
                    )
                ]
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Text('SGD',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black
                    ),
                    ),

                 Padding(padding: EdgeInsets.fromLTRB(18.0, 20.0, 14.0, 10.0)),

                  Text('${widget.currency}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black
                  ))

                ]
              ),

              Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Align(widthFactor: 3.0, heightFactor: 9.0),
                  FlatButton(
                    child: Text('VIEW NEAREST EXCHANGES',
                      style: TextStyle(
                        fontSize: 20.0)),
                    padding: EdgeInsets.all(20.0),
                    color: Colors.grey[300],
                    onPressed: fetchCurrency)

                ],
              ) 
            ],
          
          )
        )
      )
    );
  }

}

Future<double> loadCurrency(String currencyName) async{

  final currencyResponse = await http.get('https://api.exchangeratesapi.io/latest?base=SGD&symbols=$currencyName');


  if(currencyResponse.statusCode == 200)
  {
    TodayCurrency todayCurrency = new TodayCurrency.fromJson(json.decode(currencyResponse.body), currencyName);
    //print(todayCurrency.value);
    return todayCurrency.value;
  }
}
