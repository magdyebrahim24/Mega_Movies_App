import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../appBar/drawerPages/setting.dart';
import '../appBar/drawerPages/profile.dart';
import '../appBar/drawerPages/contactUs.dart';
import '../sign/sign_In.dart';
import '../appBar/search.dart';
import './homePage.dart';
import './library.dart';
import './download.dart';





class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void showDialogg() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return   AlertDialog(
          title: Center(child: Text('Rate Us',style: TextStyle(color: Colors.teal,fontSize: 25),)),
          contentPadding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

          content: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height /4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlutterRatingBar(
                  initialRating: 0,
                  fillColor: Colors.teal,
                  borderColor: Colors.teal.withAlpha(70),
                  allowHalfRating: true,
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(height: 20,),
                FlatButton(
                  child: new Text("Ok",style: TextStyle(fontFamily: 'AbrilFatface',color: Colors.teal,
                      fontSize: 25),),
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
  // variable _drawerkey for drawer key
  // to use it to open drawer with button icon in appbar
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey<ScaffoldState>();


  var _titttleOfPage = ['MeGa','Library','Downloaded Movies'];

  int _selectedIndex = 0;
  var _pages = [HomePage(), Library(), DownLoad()];

  // for all drawer content
  Widget drawerContent(){
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
                    ),colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
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
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
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
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 70),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),

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
               height: MediaQuery.of(context).size.height * (2/3),
               child: ListView(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                      },
                      child: drawerItem('Profile', Icons.person_outline)),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
                      },
                      child: drawerItem('Settings', Icons.settings)),
                  InkWell(
                      onTap: ()=> showDialogg(),
                      child: drawerItem('Rate Us', Icons.star_border)),

                  InkWell(onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUs()));
                  },
                      child: drawerItem('Contact Us', Icons.mail_outline)),
                ],

            ),
             ),
        ],
      ),
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
              size: 30,
            ),
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 19),
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _drawerkey,

      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search,color: Colors.teal[800],size: 25,) ,
              onPressed: ()=>  showSearch(context: context, delegate: SearchBox())  ),
        ],
        leading: IconButton(icon:Icon(Icons.calendar_view_day,color: Colors.teal[800],size: 25,) ,
            onPressed: ()=> _drawerkey.currentState.openDrawer()),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          _titttleOfPage[_selectedIndex] ,
          style: TextStyle(color: Colors.teal[800],fontSize: 22,fontFamily: 'AbrilFatface'),
        ),
      ),


      body: _pages[_selectedIndex] ,

      drawer: Drawer(
        child: drawerContent(),
      ),


      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.teal[300],
          selectedFontSize: 11,
          //selectedIconTheme: IconThemeData(size: 25),
          unselectedFontSize: 11,
          iconSize: 22,
          elevation: 0.5,
          selectedItemColor: Colors.teal[900],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            print(index);
            setState(() {
              _selectedIndex= index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,) ,
              title: Text('Home',)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library) ,
                title: Text('Library')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_download) ,
                title: Text('Download')
            ),

          ]),




    );
  }
}
