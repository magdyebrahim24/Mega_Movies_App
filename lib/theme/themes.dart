import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARKER }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    accentColor: Colors.teal[600],
    brightness: Brightness.light,
    textTheme: TextTheme(
      body1: TextStyle(
        color: Colors.teal[600],
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Comfortaa',
      ),
    ),
  );

  static final ThemeData darkerTheme = ThemeData(
//    primaryColor: Colors.black,
    accentColor: Colors.white,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      body1: TextStyle(
        color: Colors.teal[600],
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Comfortaa',
      ),
    ),

  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARKER:
        return darkerTheme;
      default:
        return lightTheme;
    }
  }
}
