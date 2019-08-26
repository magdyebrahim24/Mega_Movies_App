import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  //final String movieName,movieImage,movieDescription;
  //Library({this.movieName,this.movieImage,this.movieDescription});
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {

  Widget favoriteList(){
    return Container(
      alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.favorite,size: 250,color: Colors.teal[100],),
            Text('Your Favorite Movies Will Be Her',
              style: TextStyle(color: Colors.teal[200],
              fontFamily: 'AbrilFatface',
              ),

            ),
            ],
        ),

    );
  }
//Widget _favouriteItem(){
//    return Padding(
//      padding: const EdgeInsets.only(bottom: 5),
//      child: Container(
//        height: 100,
//        width: MediaQuery.of(context).size.width-30,
//        child: Row(
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.only(right: 10),
//              child: Container(
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(20),
//                  border: Border.all(color: Colors.teal[500]),
//                ),
//                child: ClipRRect(
//                  borderRadius: BorderRadius.circular(20),
//                  child: Image.asset(
//                    widget.movieImage,
//                    fit: BoxFit.cover,
//                    height: 100,
//                    width: 80,
//                  ),
//                ),
//              ),
//            ),
//            Column(textDirection: TextDirection.ltr,
//              children: <Widget>[
//                Text(widget.movieName,),
//                SizedBox(height: 5,),
//                Expanded(
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Text(
//                      widget.movieDescription,
//                      textAlign: TextAlign.center,
//                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                    ),
//                  ),
//                ),
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//}
  Widget watchList(){
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
//      _favouriteItem(),
          Icon(Icons.bookmark,size: 250,color: Colors.teal[200],),
          Text('Videos You Will Watch Saved Her',
            style: TextStyle(color: Colors.teal[800],
                ),),
        ],
      ),

    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 20,
            color: Colors.teal[400]
          )
        ),
      ),

      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              child: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(
                indicatorColor: Colors.teal,
                tabs: [
                  Tab(child: Text('Watch List',
                    style: TextStyle(color: Colors.teal[700],fontSize: 20),),),
                  Tab(child: Text('Favorite List',
                    style: TextStyle(color: Colors.teal[700],fontSize: 20),),)]),
          ),
              preferredSize: Size.fromHeight(50)),
          body: TabBarView(children: [
            watchList(),
            favoriteList(),
          ]),
        ),
      ),
    );
  }
}
