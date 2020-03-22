import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2675eb),
        iconTheme: new IconThemeData(color: Colors.white),
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                  'USER ACCOUNT',
                  style: TextStyle(
                      fontSize: 23.5,
                      letterSpacing: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                  )),
              
              SizedBox(height: 5),

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
            ],
          ),
        ),
      ),

      body: Center(child: Text('Add User name, email ID, change travel preferences and change password functionality. ')), 
    
    );
  }
}