import 'package:flutter/material.dart';
import 'Screens/splash.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Mega',
      theme: ThemeData(
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.teal[800],
            fontSize: 19,
            fontWeight: FontWeight.bold,
            fontFamily: 'Comfortaa',
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    ),
  );
}
