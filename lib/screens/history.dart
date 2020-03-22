import 'package:flutter/material.dart';
import 'destination_card.dart'; 
import 'package:craftrip_app/models/destination.dart';
import 'package:craftrip_app/services/collections.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  Future<List<Destination>> travelDestinations;

  @override

  Widget build(BuildContext context) {

    return Scaffold(
    
        body: 
          Column(
            children: <Widget> [

              SizedBox(height: 12.0), 

              buildHistoryList(travelDestinations),
            ] 
        )
      );
}

Widget buildHistoryList(historyData) => FutureBuilder<dynamic> (
  future: historyData,
  builder: (context, snapshot) {
    
    // Data yet to be received- show loading progress indicator 
    if (!snapshot.hasData) return Container(

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
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.green)
              ),
            ),
          ),
        ],
      )
    );

    // Data received is void - show 'No data' 
    if (snapshot.data.length == 0) {
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

            child: Text("No History!", 
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.center),

              ),
            ),
          ],
        )
      );
    }
    
    // Data received - return destinationCard 
    return Expanded(

      child: ListView.builder(
        scrollDirection: Axis.vertical,

        itemBuilder: (context, index){

          return DestinationCard(d: snapshot.data[index]);

        },

        itemCount: snapshot.data.length),
    );
  }
);

void initState() {

  super.initState();

  setState( () {
    travelDestinations = Collections().getHistoryData();
      }
    );
  }
}