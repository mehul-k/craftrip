import 'package:flutter/material.dart';
import './screens/login_screen.dart';

void main(){
return runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
theme: ThemeData.light().copyWith(
scaffoldBackgroundColor: Colors.white,
primaryIconTheme: IconThemeData(color: Colors.black)
),
home: LoginScreen(),
);
}
}