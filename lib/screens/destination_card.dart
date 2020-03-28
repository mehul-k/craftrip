import 'package:flutter/material.dart';
import 'package:craftrip_app/models/destination.dart';
import 'package:craftrip_app/services/collections.dart';
import 'summary_screen.dart';
import 'package:flutter/cupertino.dart';
import '../services/collections.dart';

class DestinationCard extends StatefulWidget {
  @override
  Destination d;
  DestinationCard({this.d});

  @override
  _DestinationCardState createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {

  Widget build(BuildContext context) {

    // Initialising favourite button for error handling    
    if(widget.d.favourite == null)
      widget.d.favourite = false; 

    return Container(

      height: 160,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context) => Summary(travelDestination: widget.d)));
        },
        child: new Card(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
          color: Colors.grey[200],

          child: Padding(
            padding: const EdgeInsets.all(12.0),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[

                // Destination Image 
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.d.imageURL),
                    ),
                  ),
                ), 
                
                // Destination information (City, country, exchange rate and temperature) 
                Expanded(
                  child: Column(
 
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Center(
                            child: Text( widget.d.city,
                            // +', ' + widget.d.country
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),

                      SizedBox(height: 7.0),

                      Center(
                        child: Text( "Temperature", 
                          style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          
                        ),),
                      ),

                      SizedBox(height: 2.0),

                      Center(
                        child: Text(widget.d.temperature.toString() + "°C", 
                          style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          
                        ),),
                      ),

                      SizedBox(height: 3.0),

                      Center(
                        child: Text( "Exchange", 
                          style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          
                        ),),
                      ),

                      SizedBox(height: 2.0),

                      Center(
                        child: Text("1SGD = " + widget.d.exchangeRate.toString() + widget.d.currency, 
                          style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          
                        ),),
                      ),

                    ],
                  ),
                ),
                
                // Favourite button 
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 100,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Colors.black87,
                          shape: CircleBorder(),
                        ),
                        width: 30.0,
                        height: 30.0,
                        child: IconButton(
                          icon: Icon(Icons.favorite),
                          color: widget.d.favourite ? Colors.pinkAccent[400] : Colors.white,
                          iconSize: 13.0,

                          onPressed: () {
                            
                            setState(() {
                              if(widget.d.favourite == true)
                                { widget.d.favourite = false;
                                  Collections().deleteFromFavourites(widget.d);
                                  Collections().updateHistoryFavourite(widget.d, false);
                                  Collections().updateRecommendationFavourite(widget.d, false); 
                                  }
                              else
                                { widget.d.favourite = true;
                                  Collections().addToFavourites(widget.d); 
                                  Collections().updateHistoryFavourite(widget.d, true);
                                  Collections().updateRecommendationFavourite(widget.d, true);
                                  }   
                            });
                            
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//  INITIALISING DATA AND ITERATING TO DISPLAY: 

//  List<Destination> travelDestinations = [
//     Destination(city:'PARIS', country:'FRANCE', favourite: true, temperature: 34.5, exchangeRate: 50, currency: "EUR", imageURL: "https://photos.mandarinoriental.com/is/image/MandarinOriental/paris-2017-home?\$MO_masthead-property-mobile\$"),
//   ];

//   ListView.builder(
//     scrollDirection: Axis.vertical, 
//     itemBuilder: (context, index){
//     print(travelDestinations.length);
//       return DestinationCard(d: travelDestinations[index]);

//     },
//     itemCount: travelDestinations.length,),



