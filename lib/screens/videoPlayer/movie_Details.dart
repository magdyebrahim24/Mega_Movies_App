import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';
import '../../api/api.dart';

// ignore: must_be_immutable
class MovieDetails extends StatefulWidget {
  int _indexOfMovieName;
  dynamic _actorsDetail;
  MovieDetails(this._indexOfMovieName, this._actorsDetail);
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  int _setFavoriteIcon = 1;
  int _downloadedIcon = 1;
  Widget _createIcon({IconData icon, Color colorIcon}) {
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
          color: Theme.of(context).accentColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: colorIcon,
        ),
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
              border: Border.all(color: Theme.of(context).accentColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                actorImage,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * .23,
                width: 100,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: 100,
            child: Text(
              actorName,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _endOfPage({final double padding = 0.0}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Stars',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .30,
          child: Padding(
            padding: EdgeInsets.only(left: padding, right: 5.0),
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

  Widget _fullPageOfMovie() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          child: Text(
            movie['movie'][widget._indexOfMovieName]['MovieName'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decorationColor: Theme.of(context).accentColor,
              letterSpacing: 1,
              fontSize: 27,
              color: Theme.of(context).accentColor,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  movie['movie'][widget._indexOfMovieName]['Description'],
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (_setFavoriteIcon == 1) {
                            _setFavoriteIcon = 0;
                            if (!(favList.contains(widget._indexOfMovieName))) {
                              favList.add(widget._indexOfMovieName);
                            }
                          } else {
                            _setFavoriteIcon = 1;
                            favList.remove(widget._indexOfMovieName);
                          }
                        });
                      },
                      child: _setFavoriteIcon == 1 &&
                              !favList.contains(widget._indexOfMovieName)
                          ? _createIcon(
                              icon: Icons.favorite, colorIcon: Colors.white)
                          : _createIcon(
                              icon: Icons.favorite,
                              colorIcon: Colors.tealAccent)
                      ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (_downloadedIcon == 1) {
                            _downloadedIcon = 0;
                            if (!(downloadList.contains(widget._indexOfMovieName))) {
                              downloadList.add(widget._indexOfMovieName);
                            }
                          } else {
                            _downloadedIcon = 1;
                            downloadList.remove(widget._indexOfMovieName);
                          }
                        });
                      },
                      child: _downloadedIcon == 1 &&
                          !downloadList.contains(widget._indexOfMovieName)
                          ? _createIcon(
                              icon: Icons.file_download,
                              colorIcon: Colors.white)
                          : _createIcon(
                              icon: Icons.file_download,
                              colorIcon: Colors.tealAccent)),
                ],
              ),
            ),
          ],
        ),
        _endOfPage(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _videoPlayer() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: RotatedBox(
        quarterTurns: 0,
        child: YoutubePlayer(
          context: context,
          source: movie['movie'][widget._indexOfMovieName]['DescVideo'],
          quality: YoutubeQuality.MEDIUM,
          aspectRatio: 3 / 2,
          playerMode: YoutubePlayerMode.DEFAULT,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: <Widget>[
          _videoPlayer(),
          _fullPageOfMovie(),
        ],
      ),
    );
  }
}
