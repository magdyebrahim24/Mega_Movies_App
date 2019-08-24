import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../MainPages/MainPageCode.dart';
import './SignUp.dart';
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


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

  // sign in button
  Widget signButton() {
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
            'Sign In',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  // image which clip [ image in the top of sign in screen]
  Widget imagecliper() {
    return Stack(
      children: <Widget>[
        Container(
          height: 250,
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
                top: MediaQuery.of(context).size.height / 12,
              ),
              child:Column(
            children: <Widget>[
            Image(
                image: AssetImage('assets/logo.png'),
            height: 127,
            width: 120,
            fit: BoxFit.contain,
          ),

      Text(
        'MEGA',
        style: TextStyle(
            color: Colors.teal, fontSize: 35, fontFamily: 'LobsterTwo'),
      ),
      ],
    ),
            ),
          ),
        ),

        // for Skip button
        Positioned(
            top: 25,
            right: 15,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
            },
            child: Container(
              alignment: Alignment.center,
              width: 80,
              height: 30,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                color: Colors.teal[400],
              ),
              child: Text('Skip',style: TextStyle(color: Colors.white,fontSize: 15),),

            ),
          ),
        ),

      ],
    );
  }

  // for scial media  icons  [  facebook & twitter & google ]
  Widget socialMediaIcons(){
    return Padding(
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
    );}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          imagecliper(),
          SizedBox(
            height: 20,
          ),
          textForm('User Name', Icons.person_outline),
          textForm('Password', Icons.lock_open),

          signButton(),

          // for forget password text
          InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text('Forget Password',style: TextStyle(
                  fontSize: 12,color: Colors.black26,
                ),),
              ),
            ),
          ),

            // for divider container  [ -------  or sign with ---------  ]
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(height: 1,color: Colors.black26, width: 80,),
                  Text('    Or Sign in With    ',
                    style: TextStyle(fontSize: 13,color: Colors.teal[300]),),
                  Container(height: 1,color: Colors.black26, width: 80,),

                ],
              ),
            ),

        socialMediaIcons(),

          // for text [ dont have account sign up ]
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Dont Have account',style: TextStyle(
                  color: Colors.black26,
                  fontSize: 13,
                ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SingUp()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Sign Up',style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}





// class to clip photo in the top of screen
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
