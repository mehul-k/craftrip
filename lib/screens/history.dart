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
      Destination(city:'PARIS', country:'FRANCE', favourite: true, temperature: 34.5, exchangeRate: 50, currency: "EUR", imageURL: "https://photos.mandarinoriental.com/is/image/MandarinOriental/paris-2017-home?\$MO_masthead-property-mobile\$"),
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