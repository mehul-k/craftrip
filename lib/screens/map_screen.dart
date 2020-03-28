import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:craftrip_app/models/MapData.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> allMarkers = [];
  Completer<GoogleMapController> _controller = Completer();

  var data = new MapData();

  static final CameraPosition start = CameraPosition(
    target: LatLng(1.3510, 103.8198),
    zoom: 10.0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: AppBar(
            automaticallyImplyLeading: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, false),
                iconSize: 20.0,
                color: Colors.white),
            backgroundColor: Color(0xff2675eb),
            title: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('CURRENCY EXCHANGE',
                    style: TextStyle(
                        fontSize: 24.0,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                      width: 30.0,
                      child: Image.asset('assets/TravelDiaryIcon.png'),
                    ),
                    Text('CrafTrip',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 13.0,
                            color: Colors.white))
                  ],
                ),
              ],
            )),
          )),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
            primaryColor: Color(0xff2675eb),
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            new BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 40.0), title: Text("")),
            new BottomNavigationBarItem(
                icon: Icon(Icons.history, size: 40.0), title: Text("")),
            new BottomNavigationBarItem(
                icon: Icon(Icons.beenhere, size: 40.0), title: Text("")),
            new BottomNavigationBarItem(
                icon: Icon(Icons.favorite, size: 40.0), title: Text(""))
          ],
        ),
      ),
      body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(10.0),
              alignment: Alignment(1.0, 3.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('NEAREST MONEY CHANGERS',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 360.0,
                          height: 200.0,
                          child: GoogleMap(
                              initialCameraPosition: start,
                              markers: Set.from([
                                data.mar1,
                                data.mar2,
                                data.mar3,
                                data.mar4,
                                data.mar5,
                                data.mar6,
                                data.mar7,
                                data.mar8,
                                data.mar9,
                                data.mar10,
                                data.mar11,
                                data.mar12,
                                data.mar13,
                                data.mar14,
                                data.mar15,
                                data.mar16
                              ]),
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              }))
                    ],
                  )
                ],
              ))),
    );
  }
}
