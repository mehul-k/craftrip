import 'package:craftrip_app/services/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flushbar/flushbar.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();
  bool passwordVisible;

  @override
  void initState() {
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2675eb),
          elevation: 0.0,
        ),
        backgroundColor: Color(0xff2675eb),
        body: new Center(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                0.0, 0.0, 0.0, 0.0),
                            child: Text('CrafTrip',
                              style: TextStyle(
                                  fontSize: 36.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white
                              ),
                              textAlign: TextAlign.center,)),


                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 150.0,
                                  child: TextFormField(
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                        hintText: 'First Name',
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
                                    controller: firstnameController,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 150.0,
                                  child: TextFormField(
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                        hintText: 'Last Name',
                                        hintStyle: TextStyle(
                                            color: Colors.white
                                        )
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    controller: lastnameController,
                                  ),
                                ),
                              ),
                            ]

                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              decoration: InputDecoration(
                                  hintText: 'Email ID',
                                  icon: new Icon(
                                      Icons.alternate_email,
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
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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
                              controller: passwordController1,

                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  icon: new Icon(
                                      Icons.lock,
                                      color: Colors.white
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.white
                                  )
                              ),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              controller: passwordController2,
                            ),
                          ),
                        ),


                        Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                            child: Container(
                              width: 300.0,
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () async {
                                  String username = usernameController.text;
                                  String firstname = firstnameController.text;
                                  String lastname = lastnameController.text;
                                  String password = passwordController1.text;
                                  if(passwordController1.text == passwordController2.text){
                                    var sessToken = await RegisterModel().handleSignUp(firstname, lastname, username, password);

                                    if(sessToken!=null){
                                      showCorrectInfoFlushbar(context);
                                    }
                                    else{
                                      showIncorrectInfoFlushbar(context);
                                    }
                                  }
                                  else{
                                    showIncorrectPwFlushbar(context);
                                  }
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                color: Color(0xFF53C759),
                              ),
                            )),


                      ]
                  )
                ))
    );
  }

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

  void showIncorrectPwFlushbar(BuildContext context) {
    Flushbar(
      title: 'Wrong Credentials!',
      message: 'Passwords dont match! Please try again.',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.green,
      ),
      leftBarIndicatorColor: Colors.green,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void showCorrectInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Success!',
      message: 'User successfully registered! Please login.',
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