import 'package:flutter/material.dart';
import 'destination_card.dart'; 
import 'package:craftrip_app/models/destination.dart';
import 'package:craftrip_app/services/collections.dart';
import 'package:craftrip_app/services/recommendations.dart';

class Recommendation extends StatefulWidget {
  @override
  _RecommendationState createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  
  // Destination values queried from Firestore 
  List<Destination> remainingDestinations;
  List<Destination> historyDestinations;
  Future<dynamic> travelDestinations;

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

           Padding(
             padding: const EdgeInsets.all(6.0),
             child: Text("Top recommendations for you, based on your most swiped tags!",
             textAlign: TextAlign.center,
             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),

             ),
           ), 
           
           buildRecommendationList(travelDestinations),
        ] 
      )
    ); 
  }

Widget buildRecommendationList(recommendationData) => FutureBuilder<dynamic> (
  future: recommendationData,
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

            child: Text("No Recommendations!", 
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
        generateLists();
         }
    );
  }

  generateLists() async {
    remainingDestinations = await Collections().getUserDestinations();
    historyDestinations = await Collections().getHistoryData();
    setState(() {
      travelDestinations = Recommendations().generateRecommendations(historyDestinations, remainingDestinations);

    });

  }
}