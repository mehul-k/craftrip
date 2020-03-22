import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'login_screen.dart';

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
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget> [
        Text('Add User name, email ID, change travel preferences and change password functionality. '),     

        ] 
      ), 

      // SIGN OUT BUTTON 
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(
          onPressed: () {
          // Sign out, to LoginScreen()
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          label: Text('SIGN OUT', 
          style: TextStyle(color: Colors.black87),),
          icon: Icon(Icons.exit_to_app, color: Colors.black87,),
          backgroundColor: Colors.grey[200],
        ),
      ),
    
    );
  }
}