import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../mainPages/mainPage.dart';
import './sign_Up.dart';
import 'package:url_launcher/url_launcher.dart';


class SignIn extends StatefulWidget {


  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userPasswordController = TextEditingController();
  String _errorPassword ='Forget Password';
  Color _colorErrorPassword = Colors.black26;

  _launchFaceURL() async {
    const url = 'https://www.facebook.com/login.php';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchTwitterURL() async {
    const url = 'https://twitter.com/home?lang=ar';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchGmailURL() async {
    const url = 'https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
//Before calling any methods, set the configuration
  Widget _signInTextForm(
      {String hintText,
      IconData icon,
      bool obSecure = false,
      TextEditingController textController}
      ){
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
            child: TextFormField(
              controller: textController,
              obscureText: obSecure,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.teal[200]),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _signInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 5),
      child: InkWell(
        onTap: (){
          if(
              _userNameController.text.trim()=='user'&&
              _userPasswordController.text.trim()=='user'
          ){
            setState(() {
              _errorPassword ='Forget Password';
              _colorErrorPassword = Colors.black26;
            });
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          }else{
              setState(() {
                _errorPassword='Sorry UserName or Password Wrong';
                _colorErrorPassword=Colors.red;
              });
          }
        },
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
  Widget _topOfPage() {
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
              child: Column(
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
                        color: Colors.teal,
                        fontSize: 35,
                        fontFamily: 'LobsterTwo'),
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
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainPage()));
            },
            child: Container(
              alignment: Alignment.center,
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal[400],
              ),
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _socialMediaIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {_launchFaceURL();},
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
            onTap: () {
              _launchTwitterURL();
            },
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
            onTap: (){
              _launchGmailURL();
            },
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
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _topOfPage(),
          SizedBox(
            height: 20,
          ),
          _signInTextForm(hintText:'User Name',icon:Icons.person_outline,textController: _userNameController),
          _signInTextForm(hintText:'Password',icon:Icons.lock_open,obSecure:true,textController:_userPasswordController),
          _signInButton(),
          // for forget password text
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(
                  _errorPassword,
                  style: TextStyle(
                    fontSize: 12,
                    color: _colorErrorPassword,
                  ),
                ),
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
                Container(
                  height: 1,
                  color: Colors.black26,
                  width: 80,
                ),
                Text(
                  'Or Sign in With',textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.teal[300]),
                ),
                Container(
                  height: 1,
                  color: Colors.black26,
                  width: 80,
                ),
              ],
            ),
          ),
          _socialMediaIcons(),
          // for text [ don't have account sign up ]
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't Have account",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 13,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SingUp()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
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
