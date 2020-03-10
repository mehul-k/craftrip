import 'package:flutter/material.dart';
import 'destination_card.dart'; 
import 'package:craftrip_app/models/destination.dart';


class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override

  // Hardcoding destination values 
  List<Destination> travelDestinations = [
        Destination(city:'PARIS', country:'FRANCE', favourite: true, temperature: 34.5, exchangeRate: 50, currency: "EUR", imageURL: "https://photos.mandarinoriental.com/is/image/MandarinOriental/paris-2017-home?\$MO_masthead-property-mobile\$"),
      ];

  Widget build(BuildContext context) {
  return Scaffold(

       body: 
       Column(
         children: <Widget> [

           SizedBox(height: 15.0), 

           Text("FAVOURTIES (" + travelDestinations.length.toString() + ")", 
           textAlign: TextAlign.center,
           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0), 
           
           ), 
           
           Expanded(
              child: ListView.builder(
              scrollDirection: Axis.vertical, 
              itemBuilder: (context, index){
              print(travelDestinations.length);
                return DestinationCard(d: travelDestinations[index]);

              },
              itemCount: travelDestinations.length,),
              ),
        ] 
      )
    ); 
  }
}