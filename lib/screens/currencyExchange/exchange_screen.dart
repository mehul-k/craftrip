import 'package:flutter/material.dart';
import 'dart:async';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:craftrip_app/models/PeriodicExchange.dart';
import 'package:craftrip_app/services/moneyController.dart';
import 'package:craftrip_app/screens/currencyExchange/map_screen.dart';
import 'package:flutter/cupertino.dart';

class ExchangeScreen extends StatefulWidget{

  var currency;

  ExchangeScreen({@required this.currency});


  @override
  State<StatefulWidget> createState() {
    return _ExchangeScreenState();
  }
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  //dynamic fetchCurrency;
  Future<double> fetchToday;
  MoneyManager manager = MoneyManager();
  Future<List<PeriodicExchange>> periodicCurrency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
              automaticallyImplyLeading: true,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                  iconSize: 20.0,
                  color: Colors.white),
              backgroundColor: Color(0xff2675eb),
              title: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
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
              )),
            ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              buildPeriodicList(periodicCurrency),
              SizedBox(height: 30.0),
              buildCurrencyData(fetchToday),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Align(widthFactor: 3.0, heightFactor: 9.0),
                  FlatButton(
                      child: Text('VIEW NEAREST EXCHANGES',
                          style: TextStyle(fontSize: 18.0)),
                      padding: EdgeInsets.all(20.0),
                      color: Colors.grey[300],
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => MapScreen()),
                        );
                      })
                ],
              )
            ],
          ),
        ));
  }

  Widget buildPeriodicList(apiData) => FutureBuilder<dynamic>(
      future: apiData,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Container(
              height: 300,
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
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green)),
                    ),
                  ),
                ],
              ));
        if (snapshot.data == 0) {
          return Container(
              height: 300,
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.all(5),
                      child: Text("No currency data currently available!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ));
        }

        return Center(
            child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment(1.0, 3.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: 370,
                            height: 250,
                            child: SfCartesianChart(
                                primaryXAxis: DateTimeAxis(
                                    title: AxisTitle(text: 'DATE')),
                                primaryYAxis: NumericAxis(
                                    title: AxisTitle(text: 'CURRENCY RATE')),
                                legend: Legend(isVisible: false),
                                tooltipBehavior: TooltipBehavior(enable: true),
                                series: <
                                    LineSeries<PeriodicExchange, DateTime>>[
                                  LineSeries<PeriodicExchange, DateTime>(
                                      dataSource: snapshot.data,
                                      xValueMapper:
                                          (PeriodicExchange exchange, _) =>
                                              exchange.date,
                                      yValueMapper:
                                          (PeriodicExchange exchange, _) =>
                                              exchange.value,
                                      dataLabelSettings:
                                          DataLabelSettings(isVisible: false))
                                ])),
                      ],
                    ),
                  ],
                )));
      });

  Widget buildCurrencyData(apiData) => FutureBuilder<dynamic>(
      future: apiData,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Container(
              height: 300,
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
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green)),
                    ),
                  ),
                ],
              ));
        if (snapshot.data == 0) {
          return Container(
              height: 300,
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.all(5),
                      child: Text("No currency data available!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ));
        }

        return Center(
            child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment(1.0, 3.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                //Box
                                height: 60.0,
                                width: 120.0,
                                padding: EdgeInsets.all(1.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                        style: BorderStyle.solid)),
                                alignment: Alignment.center,
                                child: FutureBuilder<dynamic>(
                                    future: manager.loadCurrency('SGD'),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<dynamic> snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          snapshot.data.toString(),
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            letterSpacing: 1.5,
                                          ),
                                          textAlign: TextAlign.center,
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text("-");
                                      }
                                      return CircularProgressIndicator();
                                    })),
                            Text('=',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 50.0, color: Colors.black)),
                            Container(
                                //Box
                                height: 60.0,
                                width: 120.0,
                                padding: EdgeInsets.all(1.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                        style: BorderStyle.solid)),
                                alignment: Alignment.center,
                                child: FutureBuilder<dynamic>(
                                    future: manager.loadCurrency('${widget.currency}'),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(snapshot.data.toString(),
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black,
                                              letterSpacing: 1.5,
                                            ),
                                            textAlign: TextAlign.center);
                                      } else if (snapshot.hasError) {
                                        return Text("-");
                                      }
                                      return CircularProgressIndicator();
                                    }))
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'SGD',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(
                                    18.0, 20.0, 14.0, 10.0)),
                            Text('${widget.currency}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black))
                          ])
                    ])));
      });

  void initState() {
    super.initState();
    periodicCurrency = manager.loadPeriodic('${widget.currency}');
    fetchToday = manager.loadCurrency('${widget.currency}');
  }
}
