import 'package:flutter/material.dart';
import 'destination_card.dart'; 
import 'package:craftrip_app/models/destination.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  
  // Hardcoding destination values 
  List<Destination> travelDestinations = [
      Destination(city:'HAVANA', country:'CUBA', favourite: true, temperature: 36.42, exchangeRate: 2.62, currency: "PHP", imageURL: "https://i.pinimg.com/originals/38/ec/37/38ec376b794073fee036d897346f7de2.jpg"),
    ];

  Widget build(BuildContext context) {
  return ListView.builder(
      scrollDirection: Axis.vertical, 
      itemBuilder: (context, index){
      print(travelDestinations.length);
        return DestinationCard(d: travelDestinations[index]);

      },
      itemCount: travelDestinations.length,
    ); 
  }
}