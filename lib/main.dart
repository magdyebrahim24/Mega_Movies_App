import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/splash.dart';
import 'theme/custom_theme.dart';
import 'theme/themes.dart';

void main() {
  runApp(
    CustomTheme(
      initialThemeKey: MyThemeKeys.LIGHT,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Colors.teal,
//      statusBarIconBrightness: Brightness.dark,
//      statusBarBrightness: Brightness.light// status bar color
//    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MeGa',
      theme: CustomTheme.of(context),
      home: Splash(),
    );
  }
}