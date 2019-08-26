import 'package:flutter/material.dart';
import '../../mainPages/mainPage.dart';
import '../../appBar/drawerPages/privacyPolicy.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
              body1: TextStyle(
        color: Colors.teal[800],
        fontSize: 17,
        fontWeight: FontWeight.normal,
        fontFamily: 'Comfortaa',
      ))),
      home: _PageContent(),
    );
  }
}

class _PageContent extends StatefulWidget {
  @override
  __PageContentState createState() => __PageContentState();
}

class __PageContentState extends State<_PageContent> {

  // item [ row ] that has text hlke [ languae & icon ] ...
  Widget item(String text, IconData icon1) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              icon1,
              color: Colors.teal[500],
              size: 23,
            ),
          ),
          Expanded(
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }

  // widget fot Mode ite
  Widget modeItems(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 80),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                text,
                style: TextStyle(color: Colors.teal[500]),
              )),
              Icon(
                Icons.check,
                color: Colors.teal[500],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(color: Colors.teal[500]),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.teal[400],size: 21,)),

      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
                onTap: () {}, child: item('Language', Icons.language)),
             item('Mode', Icons.color_lens,),
            InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: modeItems('Dark Mode')),
            InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
                child: modeItems('Lite Mode')),
            SizedBox(height: 15,),
            InkWell(onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));

            },child: item('Privacy Policy', Icons.lock_outline)),
          ],
        ),
      ),
    );
  }
}
