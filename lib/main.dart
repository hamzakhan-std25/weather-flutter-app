import 'package:flutter/material.dart';
// import 'package:weather_app/Screens/check.dart';
// import 'package:weather_app/Screens/new.dart';
// import 'package:weather_app/Screens/app3.dart';
// import 'package:weather_app/Screens/main_Screen.dart';
import 'package:weather_app/Screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Weather App',
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
