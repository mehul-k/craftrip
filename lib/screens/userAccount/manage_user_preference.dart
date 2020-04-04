import 'package:flutter/material.dart';
import '../../services/collections.dart';
import 'package:craftrip_app/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';

class ManageUserPreference extends StatefulWidget {
  @override
  _ManageUserPreferenceState createState() => _ManageUserPreferenceState();
}

class _ManageUserPreferenceState extends State<ManageUserPreference> {
  
  List<int> defaultCheck = [0,0,0,0,0,0,0,0,0];
  Future<dynamic> s;
  String extractedBucketTag;

  void updateChecklist(String btag)
  {
    if(btag == 'Bucket_Historical_Architecture')
    {
      updateState(0);
    }
    else if(btag == 'Bucket_Mountainous_Landscape')
    {
      updateState(1);
    }
    else if (btag == 'Bucket_Coastal_Landscape')
    {
      updateState(2);
    }
    else if(btag == 'Bucket_Urban_Landscape')
    {
      updateState(3);
    }
    else if(btag == 'Bucket_Entertainment')
    {
      updateState(4);
    }
    else if(btag == 'Bucket_Adventure')
    {
      updateState(5);
    }
    else if(btag == 'Bucket_Landmark')
    {
      updateState(6);
    }
    else if(btag == 'Bucket_Vibrant_Atmosphere')
    {
      updateState(7);
    }
    else if(btag == 'Bucket_Calm_Atmosphere')
    {
      updateState(8);
    }
  }

  void updateState (int index) 
  {
      for(int i = 0; i < defaultCheck.length; i++)
      {
        defaultCheck[i] = 0;
      }

      defaultCheck[index] = 1;
      print(defaultCheck.toString() +"1ad");
    
  }

  // Check default
  bool stateDefault() 
  {
    for(int i = 0; i < defaultCheck.length; i++)
      {
        if (defaultCheck[i] != 0)
        {
          return false;
        }
      
      }
      return true;
  }

  // initState called when the widget is mounted.
  @override
  void initState() {
    super.initState();
    setState( ()
     {
        generateBucketTag();
      } 
    );  
  }
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      title: 'Flutter Weather App',
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      home: Scaffold(
        backgroundColor: Colors.white,
      
        appBar: PreferredSize
        ( preferredSize: Size.fromHeight(65.0),
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            
            backgroundColor: Color(0xff2675eb),
            
            title: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: <Widget>[
                  Text('PREFERENCE',
                    style: TextStyle(
                      fontSize: 24.0,
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
                        width: 30.0,
                        child: Image.asset('assets/TravelDiaryIcon.png'),
                      ),

                      Text('CrafTrip',
                        style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          body:  
            buildBucketTag(s),     
      )
    );
  }

  Widget buildBucketTag(s) => FutureBuilder<dynamic>  (
      
      future: s,
      builder: (context,snapshot){
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
                Colors.green)
                ),
              ),
            ),
          ],
        )
      );

        else
        print(extractedBucketTag);
        updateChecklist(extractedBucketTag);
        print(extractedBucketTag);
        print("After updatechecklist" + defaultCheck.toString());
        
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Please select your new preferences",
                  style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 0.5,
                      color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  ),
                ),

              // Row 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: <Widget>[
                    // Historical Architecture 
                    SizedBox(
                    width: 125.0,
                    height: 48.0,
                    child: FlatButton(
                      onPressed: () {
                          setState(()
                          {
                            updateState(0);
                          });
                          defaultCheck[0] == 0 ? Text(" ") : extractedBucketTag = 'Bucket_Historical_Architecture';
                        },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Historical \nArchitecture', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                      ),
                      color: defaultCheck[0] == 0 ? Colors.white : Colors.grey[350],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2))
                      ),
                    ),

                    // Mountainous Landscape
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
                            defaultCheck[1] == 0 ? Text(" ") : extractedBucketTag= 'Bucket_Mountainous_Landscape';
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Mountainous \nLandscape', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center,),
                          ),
                          color: defaultCheck[1] == 0 ? Colors.white : Colors.grey[350],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2),)
                      ),
                    ),

                    // Coastal Landscape 
                    SizedBox(
                    width: 125.0,
                    height: 48.0,  
                    child:
                    FlatButton(
                      onPressed: () {
                        setState(()
                        {
                          updateState(2);
                        });
                        defaultCheck[2] == 0 ? Text(" ") : extractedBucketTag = 'Bucket_Coastal_Landscape'; 
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Coastal \nLandscape', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                      ),
                      color: defaultCheck[2] == 0 ? Colors.white : Colors.grey[350],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2))
                      ),
                    ),
                  ],
                ),

                Padding(padding: const EdgeInsets.only(top: 10.0)),
                
                // Row 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                  children: <Widget>[
                    // Urban Landscape 
                    SizedBox(
                    width: 125.0,
                    height: 48.0,  
                    child:
                    FlatButton(
                      onPressed: () {
                          setState(()
                          {
                            updateState(3);
                            
                          });
                          defaultCheck[3] == 0 ? Text(" ") : extractedBucketTag = 'Bucket_Urban_Landscape';
                        },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Urban \nLandscape', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                      ),
                      color: defaultCheck[3] == 0 ? Colors.white : Colors.grey[350],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2))
                      ),
                    ),

                    // Landscape 
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
                          defaultCheck[4] == 0 ? Text(" ") : extractedBucketTag = 'Bucket_Entertainment';
                          
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(1.5),
                          child: Text('Entertainment', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center,),
                        ),
                        color: defaultCheck[4] == 0 ? Colors.white : Colors.grey[350],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2),)
                      ),
                    ),
                    
                    // Adventure 
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
                          defaultCheck[5] == 0 ? Text(" ") : extractedBucketTag = 'Bucket_Adventure';
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Adventure', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                        ),
                        color: defaultCheck[5] == 0 ? Colors.white : Colors.grey[350],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2))
                      ),
                    ),
                  ],
                ),

                Padding(padding: const EdgeInsets.only(top: 10.0)),
                
                // Row 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                  children: <Widget>[
                    // Landmark 
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
                          defaultCheck[6] == 0 ? Text(" ") : extractedBucketTag = 'Bucket_Landmark';
                        },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Landmark', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                            ),
                            color: defaultCheck[6] == 0 ? Colors.white : Colors.grey[350],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2))
                          ),
                        ),

                      // Vibrant Atmosphere 
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
                            defaultCheck[7] == 0 ? Text(" ") : extractedBucketTag = 'Bucket_Vibrant_Atmosphere';
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Vibrant \nAtmosphere', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center,),
                          ),
                          color: defaultCheck[7] == 0 ? Colors.white : Colors.grey[350],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2),)
                          ),
                        ),
                        
                        // Chill Atmosphere 
                        SizedBox(
                          width: 125.0,
                          height: 48.0,  
                          child:
                          FlatButton(
                            onPressed: () {
                              setState(()
                              {
                                updateState(8);
                              });
                              defaultCheck[8] == 0 ? Text(" ") : extractedBucketTag = 'Bucket_Calm_Atmosphere';
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Chill \nAtmosphere', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                            ),
                            color: defaultCheck[8] == 0 ? Colors.white : Colors.grey[350],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2))),   
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 20.0),
                    
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: RaisedButton(
                        onPressed: (){
                        Collections().updateBucketTag(extractedBucketTag);
                        stateDefault()? Text(' ') : Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => MainScreen()));

                        },
                        child: Text('Proceed', style:TextStyle(fontSize:15.0, color: Colors.black)),
                        color: stateDefault()? Colors.grey[200] : Colors.grey
                      ),
                    ),
                  ],
                );
      }
    );

  generateBucketTag() async {
    extractedBucketTag = await Collections().getBucketTag();
    
    setState(() {
      s = convertBucketTag(extractedBucketTag);
    });
  }

  convertBucketTag(String s) async {
    return s;
  }
  
}