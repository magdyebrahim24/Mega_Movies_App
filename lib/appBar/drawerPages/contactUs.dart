import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../mainPages/mainPage.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Widget item(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              icon,
              color: Theme.of(context).accentColor,
              size: 30,
            ),
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Theme.of(context).accentColor,
                fontSize: 19),
          ),
        ],
      ),
    );
  }

  // for scial media  icons  [  facebook & twitter & google ]
  Widget socialMediaIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Icon(
                FontAwesomeIcons.facebook,
                size: 35,
                color: Colors.blue[700],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Icon(
                FontAwesomeIcons.twitter,
                size: 35,
                color: Colors.blueAccent,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Icon(
                FontAwesomeIcons.google,
                size: 35,
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainPage()));
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).accentColor,
            )),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You Con Contact With Us on',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
            item('MeGa@mail.com', Icons.mail_outline),

            // for divider container  [ -------  or Contact Wit Us ---------  ]
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 1,
                    color: Colors.blueGrey,
                    width: 100,
                  ),
                  Text('    OR    ',
                      style: TextStyle(
                          fontSize: 14, color: Theme.of(context).accentColor)),
                  Container(
                    height: 1,
                    color: Colors.blueGrey,
                    width: 100,
                  ),
                ],
              ),
            ),

            socialMediaIcons(),
          ],
        ),
      ),
    );
  }
}
