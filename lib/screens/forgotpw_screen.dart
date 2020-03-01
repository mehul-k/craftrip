import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:craftrip_app/services/resetpw.dart';
import 'package:craftrip_app/screens/login_screen.dart';
import 'package:flushbar/flushbar.dart';

class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final usernameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff2675eb),
            elevation: 0.0,
        ),
        backgroundColor: Color(0xff2675eb),
        body: Container(
            child: SafeArea(
                maintainBottomViewPadding: true,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(
                              40.0, 0.0, 0.0, 0.0),
                          child: Text('CrafTrip',
                            style: TextStyle(
                                fontSize: 36.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,)),

                      Padding(
                          padding: const EdgeInsets.fromLTRB(
                              40.0, 0.0, 0.0, 0.0),
                          child: Text('FORGOT PASSWORD',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,)),

                      SizedBox(
                        height: 50,
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
                          padding: const EdgeInsets.fromLTRB(40.0, 50.0, 0.0, 0.0),
                          child: Container(
                            width: 300.0,
                            height: 50.0,
                            child: RaisedButton(
                              onPressed: () async {
                                String username = usernameController.text;

                                var sessToken = await ResetModel().handleForgotPw(username);

                                if(sessToken){
                                    showCorrectInfoFlushbar(context);}
                                else{
                                  showIncorrectInfoFlushbar(context);
                                }
                              },
                              child: Text(
                                'Send Recovery Email',
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
                )))
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

  void showCorrectInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Success!',
      message: 'Recovery email sent to your mailbox!',
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