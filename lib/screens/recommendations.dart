import 'package:flutter/material.dart';
import 'destination_card.dart'; 
import 'package:craftrip_app/models/destination.dart';

class Recommendation extends StatefulWidget {
  @override
  _RecommendationState createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  
  
  // Extract hardcoded values from Firebase post integration 
  // Hardcoding destination values 
  List<Destination> travelDestinations = [
        Destination(city:'HAVANA', country:'CUBA', favourite: true, temperature: 36.42, exchangeRate: 2.62, currency: "PHP", imageURL: "https://i.pinimg.com/originals/38/ec/37/38ec376b794073fee036d897346f7de2.jpg"),
      ];
  
  // Hardcoding highest hit tags 
  List<String> tagHits = ["Cultural", "Historical", "Beautiful"];

  @override
  Widget build(BuildContext context) {
  return Scaffold(

       body: 
       Column(
         children: <Widget> [
          
           SizedBox(height: 25.0),

           Row(

             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[

               Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black87),
                    left: BorderSide(width: 1.0, color: Colors.black87),
                    right: BorderSide(width: 1.0, color: Colors.black87),
                    bottom: BorderSide(width: 1.0, color: Colors.black87),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                      bottom: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                    ),
                    color: Colors.white10,
                  ),
                  child: Text(
                    //First hit tag
                    tagHits[0],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)
                  ),
                ),
              ),

              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black87),
                    left: BorderSide(width: 1.0, color: Colors.black87),
                    right: BorderSide(width: 1.0, color: Colors.black87),
                    bottom: BorderSide(width: 1.0, color: Colors.black87),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                      bottom: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                    ),
                    color: Colors.white10,
                  ),
                  child: Text(
                    //Second hit tag 
                    tagHits[1],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)
                  ),
                ),
              ),

               Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black87),
                    left: BorderSide(width: 1.0, color: Colors.black87),
                    right: BorderSide(width: 1.0, color: Colors.black87),
                    bottom: BorderSide(width: 1.0, color: Colors.black87),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
                      right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                      bottom: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
                    ),
                    color: Colors.white10,
                  ),
                  child: Text(
                    // Third hit tag 
                    tagHits[2],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)
                  ),
                ),
              ),
             ],
           ),

           SizedBox(height: 12.0), 

           Text("Top recommendations for you, based on your most swiped tags!", 
           textAlign: TextAlign.center,
           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0), 
           
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