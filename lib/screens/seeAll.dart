import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../mainPages/mainPage.dart';
import '../api/api.dart';
import '../screens/videoPlayer/movie_Details.dart';

class AllMovie extends StatefulWidget {
  @override
  _AllMovieState createState() => _AllMovieState();
}

class _AllMovieState extends State<AllMovie> {
  Widget _allMovie() {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        itemCount: movie['movie'].length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, indexOfMovie) {
          return InkWell(
            onTap: () {},
            child: Card(
              color: Theme.of(context).accentColor,
              child: GridTile(
                footer: Container(
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                  ),
                  child: Text(
                    movie['movie'][indexOfMovie]['MovieName'],
                    style: TextStyle(color: Colors.white, fontSize: 16,),
                    textAlign: TextAlign.center,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    var list = movie['movie'][indexOfMovie]['actor'] as List;
                    var _actors = list.map((i) => ((i))).toList();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MovieDetails(indexOfMovie, _actors),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Theme.of(context).accentColor),
                      color: Colors.teal,),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.asset(
                          movie['movie'][indexOfMovie]['MovieImg'],
                          fit: BoxFit.fill,
                        ),
                      ),

                  ),
                ),
              ),
            ),
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Most Show',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
            onTap: () {
              SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).accentColor,
              size: 21,
            )),
      ),
      body: _allMovie(),
    );
  }
}
