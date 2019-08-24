import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../MainPages/MainPageCode.dart';
import 'SignIn.dart';

class SingUp extends StatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}
class _SingUpState extends State<SingUp> {
  // image which clip [ image in the top of sign in screen]
  Widget imagecliper() {
    return Stack(
      children: <Widget>[
        Container(
          height: 170,
          child: new ClipPath(
            clipper: MyClipper(),
            child: Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: AssetImage('assets/full-bloom.png'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: 30.0,
              ),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/logo.png'),
                    height: 95,
                    width: 90,
                    fit: BoxFit.contain,
                  ),

                  Text(
                    'MEGA',
                    style: TextStyle(
                        color: Colors.teal, fontSize: 25, fontFamily: 'LobsterTwo'),
                  ),
                ],
              ),
            ),
          ),
        ),

        // for [ back button and close button ] in sigin up page
        // for arrow back icon
        Positioned(
          top: 4,
          left: 4,
          child: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.teal,), onPressed: (){
            Navigator.pop(context);
          },),
        ),
        // for close icon
        Positioned(
          top: 4,
          right: 4,
          child: IconButton(icon: Icon(Icons.close,color: Colors.teal,size: 27,), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
          },),
        ),

      ],
    );
  }

  Widget imageclipeiir() {
    return Stack(
      children: <Widget>[
        // for Skip button



      ],
    );
  }

  // text form field
  Widget textForm(String hinttext, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.teal.withOpacity(0.5),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Icon(
              icon,
              color: Colors.teal[200],
            ),
          ),
          Container(
            height: 30.0,
            width: 1.0,
            color: Colors.teal.withOpacity(0.5),
            margin: const EdgeInsets.only(left: 00.0, right: 10.0),
          ),
          new Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hinttext,
                hintStyle: TextStyle(color: Colors.teal[200]),
              ),
            ),
          )
        ],
      ),
    );
  }

  // sign up button
  Widget signUpBtn() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 5),
        child: Container(
          alignment: Alignment.center,
          height: 45,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.teal[300], borderRadius: BorderRadius.circular(20)),
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: ListView(children: <Widget>[

          imagecliper(),

          SizedBox(height: 10,),

          textForm('User Name',Icons.person_outline),
          textForm('Email Addres',Icons.email),
          textForm('New Password',Icons.lock_open),
          textForm('ReEnter Password',Icons.lock_open),

          signUpBtn(),

          // for divider container  [ -------  or sign Up with ---------  ]
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(height: 1,color: Colors.black26, width: 80,),
                Text('    Or Sign Up With    ',
                  style: TextStyle(fontSize: 13,color: Colors.teal[300]),),
                Container(height: 1,color: Colors.black26, width: 80,),

              ],
            ),
          ),

          // row for scial media  icons  [  facebook & twitter & google ]
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Icon(FontAwesomeIcons.facebook,size: 35,color: Colors.blue[700],),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Icon(FontAwesomeIcons.twitter,size: 35,color: Colors.blueAccent,),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Icon(FontAwesomeIcons.google,size: 35,color: Colors.teal,),
                  ),
                ),
              ],
            ),
          ),

          // for text [ Already Have account sign In ]
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                // Already Have account text
                Text(
                  'Already Have account',style: TextStyle(
                  color: Colors.black26,
                  fontSize: 13,
                ),
                ),

                // sign text
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Sign in',style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                    ),
                  ),
                ),

              ],
            ),
          ),

        ],),
      ),
    );
  }
}


class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}