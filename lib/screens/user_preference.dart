import 'package:flutter/material.dart';

import '../services/collections.dart';
import 'package:craftrip_app/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';

class UserPreference extends StatefulWidget {

  @override
  _UserPreferenceState createState() => _UserPreferenceState();
}

class _UserPreferenceState extends State<UserPreference> {
  List<int> defaultCheck = [0,0,0,0,0,0,0,0,0];
  String s;

  void updateState(int index) //update
  {
    int i;
    if (defaultCheck[index] == 1)
    {
      defaultCheck[index] -= 1;
    }
    else{
      for(i = 0; i < defaultCheck.length; i++)
      {
        defaultCheck[i] = 0;

      }
      defaultCheck[index] = 1;
    }
  }

  bool stateDefault() //check default
  {
    int i;
    for(i = 0; i < defaultCheck.length; i++)
      {
        if (defaultCheck[i] != 0)
        {
          return false;
        }
      
      }
      return true;
  }
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        title: 'Flutter Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize( //App Bar
            preferredSize: Size.fromHeight(65.0),
            child: AppBar(
              backgroundColor: Color(0xff2675eb),
              title: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'PREFERENCE',
                        style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                          width: 30.0,
                          //height: MediaQuery.of(context).size.height * 0.08,
                          //width: MediaQuery.of(context).size.width * 0.18, // fixed width and height
                          //child: Image.asset('assets/TravelDiaryIcon.png'),
                        ),
                        Text('CrafTrip',
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white
                            )),
                      ],),
                  ],),
              ),
            ),),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
            "Hi there, welcome to CRAFTRIP! Let's get started - please pick your top travel tag",
                        style: new TextStyle(
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w200
                        ),
                      textAlign: TextAlign.center,
                      ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                       SizedBox(
                        width: 125.0,
                        height: 48.0,
                        child:
                        FlatButton(
                          onPressed: () {
                              setState(()
                              {
                                updateState(0);
                              });
                              defaultCheck[0] == 0 ? Text(" ") : s = 'Bucket_Historical_Architecture';
                            },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Historical \nArchitecture', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                          ),
                          color: defaultCheck[0] == 0 ? Colors.white : Colors.blue,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0),side: BorderSide(width:2))
                        ),
                      ),
                      SizedBox(
                        width: 125.0,
                        height: 48.0,  
                        child:
                      FlatButton(
                            onPressed: () {
                              setState(()
                              {
                                updateState(1);
                              });
                              defaultCheck[1] == 0 ? Text(" ") : s = 'Bucket_Mountainous_Landscape';
                              print(s);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('Mountainous \nLandscape', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center,),
                            ),
                            color: defaultCheck[1] == 0 ? Colors.white : Colors.blue,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0),side: BorderSide(width:2),)
                        ),),
                        new SizedBox(
                        width: 125.0,
                        height: 48.0,  
                        child:
                      FlatButton(
                            onPressed: () {
                              setState(()
                              {
                                updateState(2);
                              });
                              defaultCheck[2] == 0 ? Text(" ") : s = 'Bucket_Coastal_Landscape'; 
                              print(s);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Coastal \nLandscape', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                            ),
                            color: defaultCheck[2] == 0 ? Colors.white : Colors.blue,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0),side: BorderSide(width:2))
                        ),),
                    ],),
                    Padding(padding: const EdgeInsets.only(top: 10.0)),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                       new SizedBox(
                        width: 125.0,
                        height: 48.0,  
                        child:
                      FlatButton(
                          onPressed: () {
                              setState(()
                              {
                                updateState(3);
                                
                              });
                              defaultCheck[3] == 0 ? Text(" ") : s = 'Bucket_Urban_Landscape';
                            },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Urban \nLandscape', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                          ),
                          color: defaultCheck[3] == 0 ? Colors.white : Colors.blue,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0),side: BorderSide(width:2))
                        ),),
                        SizedBox(
                        width: 125.0,
                        height: 48.0,  
                        child:
                      FlatButton(
                            onPressed: () {
                              setState(()
                              {
                                updateState(4);
                              });
                              defaultCheck[4] == 0 ? Text(" ") : s = 'Bucket_Entertainment';
                              
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Text('Entertainment', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center,),
                            ),
                           color: defaultCheck[4] == 0 ? Colors.white : Colors.blue,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0),side: BorderSide(width:2),)
                        ),),
                        SizedBox(
                        width: 125.0,
                        height: 48.0,  
                        child:
                      FlatButton(
                           onPressed: () {
                              setState(()
                              {
                                updateState(5);
                              });
                              defaultCheck[5] == 0 ? Text(" ") : s = 'Bucket_Adventure';
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text('Adventure', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                            ),
                            color: defaultCheck[5] == 0 ? Colors.white : Colors.blue,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0),side: BorderSide(width:2))
                        ),),
                    ],),
                    Padding(padding: const EdgeInsets.only(top: 10.0)),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                       SizedBox(
                        width: 125.0,
                        height: 48.0,  
                        child:
                      FlatButton(
                          onPressed: () {
                              setState(()
                              {
                                updateState(6);
                              });
                              defaultCheck[6] == 0 ? Text(" ") : s = 'Bucket_Landmark';
                            },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Landmark', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                          ),
                          color: defaultCheck[6] == 0 ? Colors.white : Colors.blue,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0),side: BorderSide(width:2))
                        ),),
                        SizedBox(
                        width: 125.0,
                        height: 48.0,  
                        child:
                      FlatButton(
                            onPressed: () {
                              setState(()
                              {
                                updateState(7);
                              });
                              defaultCheck[7] == 0 ? Text(" ") : s = 'Bucket_Vibrant_Atmosphere';
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Vibrant \nAtmosphere', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center,),
                            ),
                            color: defaultCheck[7] == 0 ? Colors.white : Colors.blue,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0),side: BorderSide(width:2),)
                        ),),
                        new SizedBox(
                        width: 125.0,
                        height: 48.0,  
                        child:
                      FlatButton(
                            onPressed: () {
                              setState(()
                              {
                                updateState(8);
                              });
                              defaultCheck[8] == 0 ? Text(" ") : s = 'Bucket_Calm_Atmosphere';
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Chill \nAtmosphere', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                            ),
                            color: defaultCheck[8] == 0 ? Colors.white : Colors.blue,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0),side: BorderSide(width:2))),   
                      ),],
                    ),
                    Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: RaisedButton(
                              onPressed: (){
                              stateDefault()? Text(' ') : Collections().updateBucketTag(s); Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => MainScreen()));

                              },
                              child: Text('Proceed', style:TextStyle(fontSize:12.0, color: stateDefault()? Colors.black:Colors.white)),
                              color: stateDefault()? Colors.grey : Colors.blue
                            ),
                          ),
                        ),
                                ],),
      ));
  }
}