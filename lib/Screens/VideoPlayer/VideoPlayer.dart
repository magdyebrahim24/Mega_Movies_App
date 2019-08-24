import 'package:flutter/material.dart';
import './player.dart';
import '../../api/api.dart';

class VideoPlayer extends StatefulWidget {
  int index;
  dynamic _actors;
  VideoPlayer(this.index, this._actors);
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  Color _txtColor = Colors.teal[500];
  Color _btnColor = Colors.teal[300];

  Widget _icon(IconData a) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 1, left: 4),
      child: InkWell(
        onTap: () {
          print(widget.index);
        },
        child: Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(color: _btnColor, shape: BoxShape.circle),
          child: Icon(a),
        ),
      ),
    );
  }

  Widget _actorWidget({String img, String actor}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: _txtColor)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                img,
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
            actor,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }

  Widget stars({final double pad = 0.0}) {
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
            padding: EdgeInsets.only(left: pad, right: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget._actors.length,
                itemBuilder: (BuildContext context, index) => _actorWidget(
                      actor: widget._actors[index]['ActorName'],
                      img: widget._actors[index]['ActorImg'],
                    )),
          ),
        ),
      ],
    );
  }

  Widget _fullPage(Orientation o) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Text(
            Movie['movie'][widget.index]['MovieName'],
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
                  Movie['movie'][widget.index]['Description'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: <Widget>[
                  _icon(Icons.file_download),
                  _icon(Icons.share),
                  _icon(Icons.add_shopping_cart),
                ],
              ),
            ),
          ],
        ),
        o == Orientation.portrait ? stars(pad: 1.0) : stars(pad: 140),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _videoPlayer(Orientation o) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: o == Orientation.portrait ? 240 : 500,
      child: RotatedBox(
        quarterTurns: 0,
        child: Player(Movie['movie'][widget.index]['DescVideo']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: <Widget>[
            _videoPlayer(orientation),
            _fullPage(orientation),
          ],
        ));
  }
}
