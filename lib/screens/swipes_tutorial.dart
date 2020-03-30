import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:craftrip_app/screens/main_screen.dart';

class SwipesTutorial extends StatefulWidget {
  @override
  _SwipesTutorialState createState() => _SwipesTutorialState();
}

class _SwipesTutorialState extends State<SwipesTutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Column(
      //       children: <Widget>[
      //         Padding(
      //             padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      //             child: Text('TRAVEL PICKS TUTORIAL',
      //               style: TextStyle(
      //                   fontSize: 26
      //               ),)),
      //         Padding(
      //           padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      //           child:
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: <Widget>[
      //               SizedBox(
      //                 height: 15.0,
      //                 width:30.0,
      //                 child: Image.asset('assets/TravelDiaryIcon.png'),
      //               ),
      //               Text('PizzaRush',
      //                 style: TextStyle(
      //                     fontSize: 10
      //                 ),),
      //             ],
      //           ),)

      //       ],
      //     ),
      //     centerTitle: true,
      //     backgroundColor: Colors.green[800],


      //     actions: <Widget>[
      //       IconButton(
      //         icon: Icon(
      //           Icons.account_circle,
      //           color: Colors.white,
      //         ),
      //         onPressed: () {
      //           // Should go to User Account page
      //           // UserAccount()
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => UserAccount()),
      //           );
      //         },
      //       )
      //     ],
      //   ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/craftrip-594f5.appspot.com/o/tutorial%2FSwipesTutorial.jpg?alt=media&token=f14afa67-f38b-4c9f-901a-4ef92ed36671'), 
              fit: BoxFit.cover,
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () async {
                    setState(() {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => MainScreen()));
                    });
                  },
          child: Icon(Icons.arrow_forward_ios),
          backgroundColor: Colors.grey[800],
        ),
      
    );
  }
}