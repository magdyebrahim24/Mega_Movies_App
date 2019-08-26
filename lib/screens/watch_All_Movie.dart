import 'package:flutter/material.dart';
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
              child: GridTile(
                footer: Container(
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                  ),
                  child: Text(
                    movie['movie'][indexOfMovie]['MovieName'],
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                            movie['movie'][indexOfMovie]['MovieImg']),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Most Show',
          style: TextStyle(color: Colors.teal[500]),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.teal[400],
              size: 21,
            )),
      ),
      body: _allMovie(),
    );
  }
}
