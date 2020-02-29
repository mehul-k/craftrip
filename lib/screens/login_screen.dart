import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flushbar/flushbar.dart';
import 'package:intl/intl.dart';
import 'package:craftrip_app/services/login.dart';
import 'package:craftrip_app/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible;

  @override
  void initState() {
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        child: SafeArea(
            bottom: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('CrafTrip',
                  style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),),


                Text(
                  'TINDER FOR TRAVEL',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(
                  height: 15.0,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 50.0, 0.0, 0.0),
                  child: Container(
                    width: 300.0,
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: InputDecoration(
                          hintText: 'Email ID',
                          icon: new Icon(
                              Icons.account_circle,
                              color: Colors.white
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white
                          )
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: usernameController,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: 300.0,
                    child: TextFormField(
                      maxLines: 1,
                      autofocus: false,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        icon: new Icon(
                            Icons.lock,
                            color: Colors.white
                        ),
                        hintStyle: TextStyle(
                            color: Colors.white
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: passwordController,

                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 50.0, 0.0, 0.0),
                  child: Container(
                    width: 300.0,
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () async {
                        String username = usernameController.text;
                        String password = passwordController.text;

                        var sessToken = await LoginModel().handleSignIn(username, password);

                        if(sessToken!=null){
                          Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => MainScreen(sessToken: sessToken)));}
                        else{
                          showIncorrectInfoFlushbar(context);
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                      color: Color(0xFF53C759),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget loadingView() => Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.green,
    ),
  );

  void showIncorrectInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Wrong Credentials!',
      message: 'Please try again.',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.green,
      ),
      leftBarIndicatorColor: Colors.green,
      duration: Duration(seconds: 3),
    )..show(context);
  }



}