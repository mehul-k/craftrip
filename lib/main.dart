import 'package:craftrip_app/screens/currencyExchange/exchange_screen.dart';
import 'package:craftrip_app/screens/travelPicks/swipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'screens/login/login_screen.dart';

void main(){
  SyncfusionLicense.registerLicense("NT8mJyc2IWhiZH1nfWN9YGpoYmF8YGJ8ampqanNiYmlmamlmanMDHmg+NjsmP2NjYhM2fT0nJn02NyZ9IDQ=");
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