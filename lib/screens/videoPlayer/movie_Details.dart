import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';
import '../../api/api.dart';
import './video_Player.dart';

// ignore: must_be_immutable
class MovieDetails extends StatefulWidget {
  int _indexOfMovieName;
  dynamic _actorsDetail;
  MovieDetails(this._indexOfMovieName, this._actorsDetail);
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  Color _txtColor = Colors.teal[500];
  Color _btnColor = Colors.teal[300];
  Widget _createIcon(
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5.0,
        right: 1,
        left: 4,
      ),
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: _btnColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon),
      ),
    );
  }

  Widget _actorDetail({String actorImage, String actorName}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.teal[500]),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                actorImage,
                fit: BoxFit.cover,
                height: 150,
                width: 100,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Center(
              child: Text(
            actorName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }

  Widget _endOfPage({final double padding = 0.0}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Stars',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: _txtColor),
          ),
        ),
        SizedBox(
          height: 185,
          child: Padding(
            padding: EdgeInsets.only(left: padding, right: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget._actorsDetail.length,
                itemBuilder: (BuildContext context, index) => _actorDetail(
                      actorName: widget._actorsDetail[index]['ActorName'],
                      actorImage: widget._actorsDetail[index]['ActorImg'],
                    )),
          ),
        ),
      ],
    );
  }

  Widget _fullPageOfMovie(Orientation o) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Text(
            movie['movie'][widget._indexOfMovieName]['MovieName'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decorationColor: _txtColor,
              letterSpacing: 1,
              fontSize: 30,
              color: _txtColor,
            ),
            maxLines: 3,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movie['movie'][widget._indexOfMovieName]['Description'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: <Widget>[
                  _createIcon(
                    Icons.file_download,
                  ),
                  InkWell(
                      onTap: () {
                        Share.share('check out my website https://example.com');
                      },
                      child: _createIcon(Icons.share)),
                  _createIcon(Icons.add_shopping_cart),
                ],
              ),
            ),
          ],
        ),
        o == Orientation.portrait
            ? _endOfPage(padding: 1.0)
            : _endOfPage(padding: 140),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _videoPlayer(Orientation o) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: o == Orientation.portrait ? 215 : 375,
      child: RotatedBox(
        quarterTurns: 0,
        child: PlayerOfVideo(
            movie['movie'][widget._indexOfMovieName]['DescVideo']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: <Widget>[
            _videoPlayer(orientation),
            _fullPageOfMovie(orientation),
          ],
        ));
  }
}
