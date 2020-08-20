import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'drawerPages/contactUs.dart';
import 'drawerPages/profile.dart';
import 'drawerPages/setting.dart';
import '../sign/sign_In.dart';


class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {


  // alert dialog for reating alert
  void showDialogg() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Center(
              child: Text(
                'Rate Us',
                style:
                TextStyle(color: Theme.of(context).accentColor, fontSize: 25),
              )),
          contentPadding: EdgeInsets.all(10),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlutterRatingBar(
                  initialRating: 0,
                  fillColor: Theme.of(context).accentColor,
                  borderColor: Colors.black12.withAlpha(70),
                  allowHalfRating: true,
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  child: new Text(
                    "Ok",
                    style: TextStyle(
                        fontFamily: 'AbrilFatface',
                        color: Theme.of(context).accentColor,
                        fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // drawer row items [icon & text]
  Widget drawerItem(String text, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              icon,
              color: Colors.teal[500],
              size: 28,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // for all drawer content
  Widget drawerContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black87,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/InfinityWar.jpg',
                    ),
                    colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.darken),
                    fit: BoxFit.cover)),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: MediaQuery.of(context).size.height / 10,
                  left: 15,
                  right: 15,
                  child: Row(
                    children: <Widget>[
                      // circle with person icon
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
//                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle,
                          color: Colors.teal[700],
                        ),
                        child: Icon(
                          Icons.perm_identity,
                          color: Colors.white30,
                          size: 50,
                        ),
                      ),

                      // for sign in and arrow button [ > ]
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 15, right: 70),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * (2 / 3),
            child: ListView(
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    child: drawerItem('Profile', Icons.person_outline)),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingPage()));
                    },
                    child: drawerItem('Settings', Icons.settings)),
                InkWell(
                    onTap: () => showDialogg(),
                    child: drawerItem('Rate Us', Icons.star_border)),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ContactUs()));
                    },
                    child: drawerItem('Contact Us', Icons.mail_outline)),
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return drawerContent();
  }
}
