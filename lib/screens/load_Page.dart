import 'package:flutter/material.dart';
import './ColorLoader/colorLoader.dart';
import '../MainPages/mainPage.dart';

class LoadPage extends StatefulWidget {
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.pinkAccent,
    Colors.blue
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.teal,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorLoader(colors: colors, duration: Duration(milliseconds: 1200)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'Comming Soon ...',
                style: TextStyle(color: Colors.teal, fontFamily: 'LobsterTwo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
