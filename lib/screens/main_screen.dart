import 'package:craftrip_app/screens/favourites.dart';
import 'package:craftrip_app/screens/historyUI.dart';
import 'package:craftrip_app/screens/recommendations.dart';
import 'package:craftrip_app/screens/swipe_screen.dart';
import 'package:craftrip_app/screens/user_account.dart';
import 'package:craftrip_app/screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';




class MainScreen extends StatefulWidget {


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;
  String _title;

  final List<Widget> _children = [SwipePage(),
    History(), 
    Recommendation(),
    Favourite(),
    ];

  PageController pageController = PageController();

  @override
  void initState() {
    _title = 'TRAVEL PICKS';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith( // sets the background color of the `BottomNavigationBar`
        canvasColor: Colors.black, // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: Color(0xff2675eb),
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
    child: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.history),
            
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.beenhere),
            
          ),
          new BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
            
          )
        ],
      )),

      appBar: AppBar(
        backgroundColor: Color(0xff2675eb),
        iconTheme: new IconThemeData(color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Text(
                  _title,
                  style: TextStyle(
                      fontSize: 23.5,
                      letterSpacing: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 16.0,
                    width:26.0,
                    child: Image.asset('assets/TravelDiaryIcon.png'),
                  ),
                  Text('CrafTrip',
                      style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w300,
                          color: Colors.white
                      )),
                ],),
            ],),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 30.0,
            ),
            onPressed: () {
              // Go to User Account page

              Navigator.push(context, CupertinoPageRoute(builder: (context) => UserAccount()));
            },
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged,
        children: _children,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }


  void onTabTapped(int index) {
    pageController.jumpToPage(index);

    setState(() {
      _currentIndex = index;
      switch(index) {
        case 0: { _title = 'TRAVEL PICKS'; }
        break;
        case 1: { _title = 'HISTORY'; }
        break;
        case 2: { _title = 'RECOMMENDATIONS'; }
        break;
        case 3: { _title = 'FAVOURITES'; }
        break;
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}