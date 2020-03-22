import 'package:flutter/material.dart';
import 'destination_card.dart'; 
import 'package:craftrip_app/models/destination.dart';
import 'package:craftrip_app/services/collections.dart';


class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();

}

class _FavouriteState extends State<Favourite> {
  
  // Querying Destination objects from Firestore. 
  Future<List<Destination>> travelDestinations;
  // [
  //   Destination(city:'HAVANA', country:'CUBA', favourite: true, temperature: 36.42, exchangeRate: 2.62, currency: "PHP", imageURL: "https://i.pinimg.com/originals/38/ec/37/38ec376b794073fee036d897346f7de2.jpg"),
  // ];
 
  @override  
  Widget build(BuildContext context) {

  return Scaffold(
  
       body: 
       Column(
         children: <Widget> [

           SizedBox(height: 15.0), 

           Text("FAVOURITES",
           textAlign: TextAlign.center,
           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0), 
           
           ),

           buildFavourtiesList(travelDestinations)
        ] 
      )
    );
  }

Widget buildFavourtiesList(apiData) => FutureBuilder<dynamic> (
  future: apiData,
  builder: (context, snapshot) {

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

            child: Text("No Favourites!", 
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
  setState(()  {
    travelDestinations = Collections().getFavouritesData();
  });
}

}