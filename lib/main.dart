import 'package:flutter/material.dart';
import 'Screens/Splash.dart';
import 'package:flutter/services.dart';
import './MainPages/HomePage.dart';
import './Screens/SeeAllPage.dart';
import './api/api.dart';
import 'Screens/VideoPlayer/VideoPlayer.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mega',
      theme: ThemeData(

          textTheme: TextTheme(

          body1: TextStyle(color: Colors.teal[800],
            fontSize: 19,
              fontWeight: FontWeight.bold,fontFamily: 'Comfortaa'))),

      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
