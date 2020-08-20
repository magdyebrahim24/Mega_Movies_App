import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../screens/seeAll.dart';
import '../screens/videoPlayer/movie_Details.dart';
import '../api/api.dart';

List<String> _listImage(var movieMap) {
  List<Map> listt = movieMap as List;
  List<String> listImage = new List<String>();
  for (int i = 0; i < movie['movie'].length; i++) {
    listImage.add('${listt[i]['MovieImg']}');
  }
  return listImage;
}

int current;
var list = movie['movie'][current]['actor'] as List;
var _actors = list.map((i) => ((i))).toList();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _newMovies = 'New Movies';
  String _mostShow = 'Most Show';
  String _arabicMovies = 'Arabic Movies';
  String _topRated = 'Top Rated';
  String _cartoon = 'Cartoon';

  // variable to use it in carusaul slider widget to have index value
  //  Cursor slider the first widget in home screen [ New Movies ]
  Widget carouselSliderWidget(String labelText, Orientation o) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  labelText,
                  style: TextStyle(color: Theme.of(context).accentColor),
                )),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllMovie()));
                  },
                  child: seeAllButton(),
                ),
              ],
            ),
          ),
          CarouselSlider(
            enlargeCenterPage: true,
            autoPlay: true,
            reverse: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 2000),
            pauseAutoPlayOnTouch: Duration(seconds: 3),
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            viewportFraction: .8,
            height: o == Orientation.portrait
                ? MediaQuery.of(context).size.height / 3.60
                : 180,
            onPageChanged: (index) {
              setState(() {
                current = index;
              });
            },
            items: _listImage(movie['movie']).map(
              (i) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetails(current, _actors)));
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Theme.of(context).accentColor),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            i,
                            fit: BoxFit.fill,
                            height: 150,
                            width: 100,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }

  // for every vertical list scroll has items
  Widget verticalScroll(String labelText, int start) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  labelText,
                  style: TextStyle(color: Theme.of(context).accentColor),
                )),
                // for button [ see all button]
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllMovie()));
                  },
                  child: seeAllButton(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.70,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          var list =
                              movie['movie'][index + start]['actor'] as List;
                          var _actors = list.map((i) => ((i))).toList();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetails(index + start, _actors)));
                        });
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 140,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Theme.of(context).accentColor),
                                image: DecorationImage(
                                    image: AssetImage(movie['movie']
                                        [index + start]['MovieImg']),
                                    fit: BoxFit.fill)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                movie['movie'][index + start]['MovieImg'],
                                fit: BoxFit.fill,
                                height: 150,
                                width: 100,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                color: Colors.white10,
                              ),
                              child: Text(
                                movie['movie'][index + start]['MovieName'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  // make see all button to see all Movies page
  Widget seeAllButton() {
    return Container(
      alignment: Alignment.center,
      width: 80,
      height: 28,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        'See all',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          carouselSliderWidget(_newMovies, orientation),
          verticalScroll(_mostShow, 0),
          verticalScroll(_arabicMovies, 10),
          verticalScroll(_topRated, 5),
          verticalScroll(_cartoon, 15),
          // to make space under last List view in the end of screen
          SizedBox(
            height: 15,
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
