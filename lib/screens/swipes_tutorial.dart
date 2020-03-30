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
                      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => MainScreen()), (r) => false);
                    });
                  },
          child: Icon(Icons.arrow_forward_ios),
          backgroundColor: Color(0xff2675eb),
        ),
      
    );
  }
}