import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class SwipePage extends StatefulWidget {
  @override
  _SwipePageState createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage>
    with TickerProviderStateMixin {
  List<String> welcomeImages = [
    "https://i.pinimg.com/originals/38/ec/37/38ec376b794073fee036d897346f7de2.jpg",
    "https://i.pinimg.com/originals/38/ec/37/38ec376b794073fee036d897346f7de2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
          height: MediaQuery.of(context).size.height * 0.66,
          child: new TinderSwapCard(
            orientation: AmassOrientation.TOP,
            totalNum: welcomeImages.length,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            minWidth: MediaQuery.of(context).size.width * 0.7,
            minHeight: MediaQuery.of(context).size.height * 0.6,
            cardBuilder: (context, index) => Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.58,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://i.pinimg.com/originals/38/ec/37/38ec376b794073fee036d897346f7de2.jpg"),
                      ),
                    ),
                  ),
                  Text('city name'),
                  Text('tags'),
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
                (CardSwipeOrientation orientation, int index) {
              print(index);
              print(orientation);/// Get orientation & index of swiped card!
            },
          ),
        ),
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
          ClipOval(
            child: Material(
              color: Colors.blue, // button color
              child: InkWell(
                splashColor: Colors.red, // inkwell color
                child: SizedBox(width: 40, height: 40, child: Icon(Icons.loop)),
                onTap: () {},
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          ClipOval(
          child: Material(
          color: Colors.blue, // button color
          child: InkWell(
          splashColor: Colors.red, // inkwell color
          child: SizedBox(width: 60, height: 60, child: Icon(Icons.close)),
          onTap: () {},
          ),
          ),
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          ClipOval(
          child: Material(
          color: Colors.blue, // button color
          child: InkWell(
          splashColor: Colors.red, // inkwell color
          child: SizedBox(width: 60, height: 60, child: Icon(Icons.favorite)),
          onTap: () {},
          ),
          ),
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          ClipOval(
            child: Material(
              color: Colors.blue, // button color
              child: InkWell(
                splashColor: Colors.red, // inkwell color
                child: SizedBox(width: 40, height: 40, child: Icon(Icons.star)),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}