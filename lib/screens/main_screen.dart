import 'package:flutter/material.dart';
import 'package:craftrip_app/screens/login_screen.dart';


class MainScreen extends StatefulWidget {

  var sessToken;

  MainScreen({@required this.sessToken});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;
  final List<Widget> _children = [Icon(Icons.home),
    Icon(Icons.history),
    Icon(Icons.beenhere),
    Icon(Icons.favorite)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
      // sets the background color of the `BottomNavigationBar`
        canvasColor: Colors.black,
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: Colors.blueAccent,
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
    child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(""),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text(""),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.beenhere),
            title: Text(""),
          ),
          new BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
            title: Text(""),
          )
        ],
      )),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('CraftTrip'),
              decoration: BoxDecoration(
                  color: Colors.blueAccent
              ),
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              trailing: Icon(
                  Icons.exit_to_app
              ),
            ),

            Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 450.0, 0.0, 0.0),
                child: ListTile(
                  title: Text('Help'),
                  trailing: Icon(
                      Icons.help
                  ),
                ))

          ],
        ),
      ),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          centerTitle: false,
          title: Center(child: Text(
            'CrafTrip',
            style: TextStyle(
                fontSize: 28.0,
                color: Colors.black,
                fontWeight: FontWeight.w700
            ),
          )),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                size: 30.0,
              ),
              onPressed: () {},
            ),
          ],
          iconTheme: new IconThemeData(color: Colors.black)
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}