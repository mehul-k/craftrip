import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:craftrip_app/services/currency_webservice.dart';
import 'package:craftrip_app/screens/exchange_template.dart';
import 'package:craftrip_app/model/currency_exchange.dart';

class ExchangeScreen extends StatefulWidget{
  ExchangeScreen({Key key}) : super(key:key);
  
  @override
  State<StatefulWidget> createState() {
    return _ExchangeScreenState();
  }

}

class _ExchangeScreenState extends State<ExchangeScreen>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
          primaryColor: Color(0xff2675eb),
          textTheme: Theme
          .of(context)
          .textTheme.copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          //onTap: OnTabTapped,
          //currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("")
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text("")
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.beenhere),
              title: Text("")
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.favorite)
            )
          ],
        )),
        );




      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff2675eb),
        centerTitle: false,
        title: Center(child: Text('CrafTrip',
              style: TextStyle(
                fontSize: 28.0,
                color: Colors.black,
                fontWeight: FontWeight.w700
              ),
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 30.0,
              ),
              onPressed: () {},
              )
        ],
        iconTheme: new IconThemeData(color: Colors.black)
      )
    )
  }
  
}