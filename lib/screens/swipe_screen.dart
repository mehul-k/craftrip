import 'package:craftrip_app/screens/exchange_screen.dart';
import 'package:craftrip_app/screens/summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:craftrip_app/models/destination.dart';
import 'package:craftrip_app/services/collections.dart';
import 'package:craftrip_app/services/WeatherManager.dart';
import 'package:flutter/cupertino.dart';

class SwipePage extends StatefulWidget {

  @override
  _SwipePageState createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage>
    with AutomaticKeepAliveClientMixin{

  Future<List<Destination>> travelDestinations;
  WeatherManager weatherManager;
  CardController controller;
  static Destination currentDestination;
  static int index1 = 0;
  var swipes = 0;

  @override
  Widget build(BuildContext context) {//Use this to trigger swap.

    return new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height:15.0),
          buildDestinationList(travelDestinations),
        SizedBox(height:3.0),
        buttonsRow()]
      );
  }

  Widget buttonsRow() {

    return Container(

      height: MediaQuery.of(context).size.height * 0.1,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[

          // UNDO BUTTON 
          ClipOval(
            child: Material(
              color: Colors.grey[100], // button color
              child: InkWell(
                splashColor: Colors.black87, // inkwell color
                child: SizedBox(width: 40, height: 40, child: Icon(Icons.undo, color: Colors.yellow[700])),
                onTap: () {
                },
              ),
            ),
          ),

          Padding(padding: EdgeInsets.only(right: 18.0)),

          // SWIPE LEFT BUTTON 
          ClipOval(
            child: Material(
              color: Colors.grey[100], // button color
              child: InkWell(
                splashColor: Colors.black87, // inkwell color
                child: SizedBox(width: 50, height: 50, child: Icon(Icons.close, color: Colors.red[800])),
                onTap: () {
                  controller.triggerLeft();
                },
              ),
            ),
          ),

          Padding(padding: EdgeInsets.only(right: 18.0)),

          // VIEW SUMMARY DETAILS 
          ClipOval(
            child: Material(
              color: Colors.grey[100], // button color
              child: InkWell(
                splashColor: Colors.black87, // inkwell color
                child: SizedBox(width: 60, height: 60, child: Icon(Icons.menu, color: Colors.purple[700])),
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => Summary(travelDestination: currentDestination)));
                },
              ),
            ),
          ),

          Padding(padding: EdgeInsets.only(right: 8.0)),

          // SWIPE RIGHT BUTTON 
          ClipOval(
          child: Material(
            color: Colors.grey[100], // button color
            child: InkWell(
              splashColor: Colors.black87, // inkwell color
              child: SizedBox(width: 50, height: 50, child: Icon(Icons.check, color: Colors.green)),
              onTap: () {
                setState(() {
                  controller.triggerRight();
                });
              },
              ),
            ),
          ),

          Padding(padding: EdgeInsets.only(right: 18.0)),
          
          // FAVOURITE BUTTON 
          ClipOval(
            child: Material(
              color: Colors.grey[100], // button color
              child: InkWell(
                splashColor: Colors.black87, // inkwell color
                child: SizedBox(width: 40, height: 40, child: Icon(Icons.favorite, color: Colors.pink[400])),
                onTap: () async {

                  controller.triggerRight();
                  await Collections().addToFavourites(currentDestination);
                  await Collections().updateHistoryFavourite(currentDestination, true);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildDestinationList(apiData) => FutureBuilder<dynamic> (
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

                      child: Text("No Cards!",
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
        
        currentDestination = snapshot.data[index1];

        return Container(
          height: MediaQuery.of(context).size.height * 0.66,
          child: new TinderSwapCard(
            orientation: AmassOrientation.TOP,
            totalNum: snapshot.data.length,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 1,
            maxHeight: MediaQuery.of(context).size.height * 1,
            minWidth: MediaQuery.of(context).size.width * 0.7,
            minHeight: MediaQuery.of(context).size.height * 0.6,
            cardBuilder: (context, index) => Card(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.58,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(snapshot.data[index].imageURL),
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: <Widget>[
                              Container(color: Colors.white.withOpacity(0.8), child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('CULTURAL ', style:TextStyle(color: Colors.black..withOpacity(0.5), fontSize: 14.0, fontWeight: FontWeight.w600)),
                              )),
                              SizedBox(width:5.0),
                              Container(color: Colors.white.withOpacity(0.8), child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('VIBRANT', style:TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14.0, fontWeight: FontWeight.w600)),
                              )),
                              SizedBox(width:5.0),
                              Container(color: Colors.white.withOpacity(0.8), child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('FUN', style:TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 14.0, fontWeight: FontWeight.w600)),
                              )),
                            ],)
                        ),
                      ),
                      SizedBox(height:8.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Text(snapshot.data[index].city, style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, letterSpacing: 0.3), textAlign: TextAlign.left,),
                            Text(", ", style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, letterSpacing: 0.3)),
                            Text(snapshot.data[index].country, style:TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, letterSpacing: 0.3), textAlign: TextAlign.left,),
                          ],
                        ),
                      ),
                    ])),

            cardController: controller = CardController(),
            swipeUpdateCallback:
                (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                print('left swipe');//Card is LEFT swiping
              } else if (align.x > 0) {
                print('right swipe');//Card is RIGHT swiping
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) async {
              print(index);
              print(orientation);
              if(orientation == CardSwipeOrientation.RIGHT) {
                await addInfoToDestination(snapshot.data[index]);
                Collections().addToHistory(snapshot.data[index]);
                index1 = index+1;
                currentDestination = snapshot.data[index+1];// Get orientation & index of swiped card!
              }
              if(orientation == CardSwipeOrientation.LEFT){
                await addInfoToDestination(snapshot.data[index]);
                index1 = index+1;
                currentDestination = snapshot.data[index+1]; // Get orientation & index of swiped card!
              }
            },
          ),
        );
      }
  );

  void initState() {

    super.initState();

    setState( () {
        travelDestinations = Collections().getDestinations();
    }
    );
  }

  addInfoToDestination(Destination d) async {
    d.exchangeRate = (await ExchangeScreen(currency: d.currency).loadCurrency(d.currency)).toDouble();
    d.temperature =  (await WeatherManager().loadCurrentTemp(d.city)).toDouble();
  }


  @override
  bool get wantKeepAlive => true;

}