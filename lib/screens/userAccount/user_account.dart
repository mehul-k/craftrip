import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flushbar/flushbar.dart';

import '../login/login_screen.dart';
import 'package:craftrip_app/services/collections.dart';
import 'package:craftrip_app/services/resetpw.dart';
import 'package:craftrip_app/screens/userAccount/manage_user_preference.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {

  Future<List<String>> userInfo;
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
          backgroundColor: Color(0xff2675eb),
          
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 0.0),
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

      body: displayUserInfo(userInfo),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          
          child: FloatingActionButton.extended(
            onPressed: () {
              // Sign out, to LoginScreen()
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (r) => false);
            },
            label: Text('SIGN OUT',
              style: TextStyle(color: Colors.black87),),
            icon: Icon(Icons.exit_to_app, color: Colors.black87,),
            backgroundColor: Colors.grey[200],
          ),
        )  
    );
  }

Widget displayUserInfo(userInfo) => FutureBuilder<dynamic> (
  future: userInfo,
  builder: (context, snapshot) {

    // Loading Indicator 
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
              Colors.grey)
              ),
            ),
          ),
        ],
      )
    );

    // No data available 
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

            child: Text("Data currently unavailable!", 
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

    // User account data
    return Container(
        padding: EdgeInsets.symmetric(vertical:10.0, horizontal: 50.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: <Widget>[
            SizedBox(height:20.0),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 6.0),
              child: Text("NAME", 
                style: TextStyle(
                  fontSize: 20.0, 
                  fontWeight: 
                  FontWeight.bold)),
            ),

            SizedBox(height:8.0),
            
            Container(decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                ),
              ), 
              height: 36.0, 
              width: 380.0, 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${snapshot.data[0]}',  
                  style: TextStyle(
                    fontSize: 16.0)),
              )
            ),

            SizedBox(height:20.0),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 6.0),
              child: Text("EMAIL-ID", 
                style: TextStyle(
                  fontSize: 20.0, 
                  fontWeight: FontWeight.bold)),
            ),

            SizedBox(height:8.0),
            
            Container(decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                ),
              ), 
              height: 36.0, 
              width: 380.0, 
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${snapshot.data[1]}',  
                  style: TextStyle(
                    fontSize: 16.0)),
             )
            ),

            SizedBox(height:20.0),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 6.0),
              child: Text("MANAGE PREFERENCES", 
                style: TextStyle(
                  fontSize: 20.0, 
                  fontWeight: FontWeight.bold)),
            ),
            
            SizedBox(height:8.0),
            
            Container(
                height: 36.0, 
                width: 380.0,
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
                        onTap: (){
                          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => ManageUserPreference()), (r)=>false);
                        },
                        child: Icon(
                          Icons.arrow_forward_ios, 
                          color: Colors.black, 
                          size: 20.0,),
                      )
                    )
                  ],
                )
            ),

            SizedBox(height:20.0),

            Text("CHANGE PASSWORD", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),

            SizedBox(height:10.0),

            Center(
              child: FlatButton(
                color: Colors.grey[200],
                child: Text('SEND RECOVERY E-MAIL'),
                textColor: Colors.black,
                padding: EdgeInsets.all(15.0),
                  onPressed:  () async{
                    var sessToken = await ResetModel().handleForgotPw(snapshot.data[1]);

                    if(sessToken!=null) showCorrectInfoFlushbar(context);
                  }
                ),
            ),

            SizedBox(height:20.0),
            
            Text("RESET ALL PREFERENCES", 
              style: TextStyle(
                fontSize: 20.0, 
                fontWeight: 
                FontWeight.bold
              )
            ),

            // RESET - delete all history, favourites, recommendations and preferences 
            Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                
                child:
                Center(
                  child: FlatButton(
                    color: Colors.grey[200],
                    child: Text('RESET'),
                    textColor: Colors.black,
                    padding: EdgeInsets.all(15.0),
                    onPressed:  () async{
                      showLoadingFlushbar(context);

                      await Collections().deleteAllHistoryData();
                      await Collections().deleteAllFavouritesData();
                      await Collections().deleteAllDestinationsData();
                      await Collections().getResetDestinations();

                      showResetFlushbar(context);
                    }
                  ),
                )
              )
            ]
          ),
        );
      }
    );

  void initState() {

    super.initState();

    setState( () {
      userInfo = Collections().getUserInfo(); 
    });
  }

  void showResetFlushbar(BuildContext context) {
    Flushbar(
      title: 'Reset Successful',
      message: 'Your swipe history and favourites have been deleted.',
      icon: Icon(
        Icons.report_problem,
        size: 28,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void showLoadingFlushbar(BuildContext context) {
    Flushbar(
      title: 'Reset in Progress',
      message: 'Please wait while we erase all your previous preferences.',
      icon: Icon(
        Icons.report_problem,
        size: 28,
        color: Colors.white,
      ),
      duration: Duration(seconds: 20),
    )..show(context);
  }

  void showCorrectInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Reset Link',
      message: 'The password reset link will be sent to you registered e-mail ID.',
      icon: Icon(
        Icons.send,
        size: 28,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
    )..show(context);
  }
}