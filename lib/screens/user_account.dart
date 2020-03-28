import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'login_screen.dart';
import 'package:craftrip_app/services/collections.dart'; 

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {

  List<String>userInfo = ['Kylie Jenner', 'kyliejenner@gmail.com']; 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar:PreferredSize(    
        preferredSize:Size.fromHeight(65.0) ,
        
        child: AppBar(
          backgroundColor: Color(0xff2675eb),
          
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: <Widget>[
                Text(
                    'USER ACCOUNT',
                    style: TextStyle(
                        fontSize: 25.0,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w400
                    )
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                      width:30.0,
                      child: Image.asset('assets/TravelDiaryIcon.png'),
                    ),
                    Text('CrafTrip',
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

// END OF APP BAR

      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 50.0),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: <Widget>[
                SizedBox(height:80.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 6.0),
                  child: Text("NAME", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),

                SizedBox(height:8.0),
                
                Container(decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ), height: 36.0, width: 380.0, child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(userInfo[0],  style: TextStyle(fontSize: 16.0)),
                )),

                SizedBox(height:20.0),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 6.0),
                  child: Text("EMAIL-ID", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),

                SizedBox(height:8.0),
                
                Container(decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ), height: 36.0, width: 380.0, child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(userInfo[1],  style: TextStyle(fontSize: 16.0)),
                )),

                SizedBox(height:20.0),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 6.0),
                  child: Text("MANAGE PREFERENCES", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                
                SizedBox(height:8.0),
                
                Container(
                    height: 36.0, width: 380.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),

                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8,0,0,0),
                          child: Text('Travel Tags',  style: TextStyle(fontSize: 16.0)),
                        ),
                        
                        SizedBox(
                            width:30,
                            child: InkWell(
                              onTap: (){},
                              child: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20.0,),
                            )
                        )
                      ],
                    )
                ),

                SizedBox(height:20.0),

                Text("CHANGE PASSWORD", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),

                //Old Password
                SizedBox(height:10.0),
                
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  height: 40.0,
                  width: 380.0,
                  child: TextFormField(
                    style: TextStyle(color:Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(5.0, 0, 0, 7.0),
                      hintText: 'Enter Old Password',
                      hintStyle: TextStyle(color:Colors.black.withOpacity(0.6)),
                    ) ,
                    obscureText: true,
                    validator: (val) => val.length<6? 'Enter a password of 6+ characters': null,
                    onChanged: (val){ //gives us the value inside the form field
                      //setState(() => password = val);
                    },
                  ),
                ),
              ],)),
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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}