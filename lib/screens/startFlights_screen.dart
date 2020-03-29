import 'flightsUI.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class StartFlightsPage extends StatefulWidget {   //startFlightsPage asks user to input the depart and return date
  String cityId;

  StartFlightsPage({@required this.cityId});

  @override
  _StartFlightsState createState() => _StartFlightsState(cityId);

}

class _StartFlightsState extends State<StartFlightsPage> {
  DateTime _depDateTime = new DateTime.now();
  DateTime _retDateTime;
  final String cityId;

  _StartFlightsState(this.cityId);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: PreferredSize( //App Bar
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
        iconTheme: IconThemeData(
        color: Colors.white,
        ),
          backgroundColor: Color(0xff2675eb),
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                      'FLIGHTS PRICES',
                      style: TextStyle(
                          fontSize: 24.0,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                      width: 30.0,
                      //height: MediaQuery.of(context).size.height * 0.08,
                      //width: MediaQuery.of(context).size.width * 0.18, // fixed width and height
                      child: Image.asset('assets/TravelDiaryIcon.png'),
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


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              'Departure Date',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold ,
                color: Colors.black,
              ),
            )
            ,
            SizedBox(height:15),
            Row(
              children: <Widget>[
                SizedBox(width: 45),
                Container(
                  child:   Center(
                      child:
                      Text(
                          _depDateTime == null ? '___________________' : DateFormat.yMMMd().format(_depDateTime),
                          style: TextStyle(
//                      fontWeight: FontWeight.bold,
                            fontSize: 25,)
                      )),
                  color: Colors.grey[50],
                  width: 250.0,
                  height: 50.0,
//                  margin: const EdgeInsets.all(10.0),


                ),


                SizedBox(
                  width: 50.0,
                  height: 48.0,
                  child: RaisedButton(
                    child:  Image.asset('assets/down-arrow.png'),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: _depDateTime == null ? DateTime.now() : _depDateTime,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2021)
                      ).then((date) {
                        setState(() {
                          _depDateTime = date;
                        });
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height:45),
            Text(
              'Return Date',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold ,
                color: Colors.black,
              ),
            )
            ,
            SizedBox(height:15),
            Row(
              children: <Widget>[
                SizedBox(width: 45),
                Container(
                  child:   Center(
                      child:
                      Text(
                          _retDateTime == null ? '___________________' : DateFormat.yMMMd().format(_retDateTime),
                          style: TextStyle(
//                      fontWeight: FontWeight.bold,
                            fontSize: 25,)
                      )),
                  color: Colors.grey[50],
                  width: 250.0,
                  height: 50.0,


                ),

                SizedBox(
                  width: 50.0,
                  height: 48.0,
                  child: RaisedButton(
                    child:  Image.asset('assets/down-arrow.png'),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: _retDateTime == null ? DateTime.now() : _retDateTime,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2021)
                      ).then((date) {
                        setState(() {
                          _retDateTime = date;
                        });
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height:70),

            Container(
              width: 250,
              height: 50,
              child: RaisedButton(
                color: Colors.blue[200],
                onPressed: (){
                  navigateToFlightsPage(context);
                },
                child: const Text(
                    'Check Prices',
                    style: TextStyle(fontSize: 20)
                ),
              ),
            )


          ],
        ),
      ),
    );
  }

  Future navigateToFlightsPage(context) async {    //click Check Prices to navigate to Flights Page

    var depDate = new DateFormat("yyyy-MM-dd").format(_depDateTime);
    var retDate = new DateFormat("yyyy-MM-dd").format(_retDateTime);

    Navigator.push(context, MaterialPageRoute(builder: (context) => FlightsPage(depDate, retDate, cityId)));

  }









}