import 'package:flutter/material.dart';
import '../appBar/search.dart';
import './homePage.dart';
import './favorite.dart';
import './download.dart';
import '../appBar/drawer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  // variable _drawerkey for drawer key
  // to use it to open drawer with button icon in appbar
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey<ScaffoldState>();

  var _tittleOfPage = ['MeGa', 'Favorite', 'Download List'];
  int _selectedIndex = 0;
  var _pages = [HomePage(), Favorite(), DownLoad()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                size: 25,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () =>
                  showSearch(context: context, delegate: SearchBox())),
        ],
        leading: IconButton(
            icon: Icon(Icons.calendar_view_day,
                size: 25, color: Theme.of(context).accentColor),
            onPressed: () => _drawerkey.currentState.openDrawer()),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          _tittleOfPage[_selectedIndex],
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 22,
              fontFamily: 'LexendDeca'),
        ),
      ),
      body: _pages[_selectedIndex],
      drawer: Drawer(
        child: DrawerComponent(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          iconSize: 22,
          elevation: 0.5,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            print(index);
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text(
                  'Home',
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library), title: Text('Favourite')),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_download), title: Text('Download')),
          ]),
    );
  }
}
