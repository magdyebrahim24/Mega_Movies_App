import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../mainPages/library.dart';


class PlayerOfVideo extends StatefulWidget {
  final String videoName;
  PlayerOfVideo(this.videoName);
  @override
  _PlayerOfVideoState createState() => _PlayerOfVideoState();
}
class _PlayerOfVideoState extends State<PlayerOfVideo> {
  VideoPlayerController _videoController;
  double _initVolume = 1.0;
  int _setFavoriteIcon = 1;
  int _hidePositioned = 1;
  @override
  void initState() {
    setState(() {
      _videoController = VideoPlayerController.asset(widget.videoName)
        ..initialize()
        ..setVolume(_initVolume);
    });
    super.initState();
  }
  Widget _createIcon(IconData icon, {Color color = Colors.white70}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 1, left: 4),
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Icon(icon, color: color),
      ),
    );
  }
  void _setVolume() {
    setState(() {
      if (_initVolume == 1.0) {
        _videoController.setVolume(0.0);
        _initVolume = 0.1;
      } else {
        _videoController.setVolume(1.0);
        _initVolume = 1.0;
      }
    });
  }
  Widget _setPositionedInStack(Orientation o) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: o == Orientation.portrait ? 240 : 390,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            left: 1.0,
            top: 2.0,
            child: InkWell(
              onTap: () {
                setState(() {
                  _videoController.pause();
                });
                Navigator.pop(context);
              },
              child: _createIcon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
          Positioned(
            left: 1.0,
            bottom: 7.0,
            child: InkWell(
              onTap: _setVolume,
              child: _initVolume == 1.0
                  ? _createIcon(
                      Icons.volume_up,
                    )
                  : _createIcon(
                      Icons.volume_off,
                    ),
            ),
          ),
          Positioned(
            right: 1.0,
            top: 2.0,
            child: InkWell(
              onTap: () {
                setState(
                  () {
                    if (_setFavoriteIcon == 1) {
                      _setFavoriteIcon = 0;
                    } else {
                      _setFavoriteIcon = 1;
                    }
                  },
                );
              },
              child: _setFavoriteIcon == 1
                  ? _createIcon(Icons.favorite_border, color: Colors.white70)
                  : _createIcon(Icons.favorite, color: Colors.teal),
            ),
          ),
          Positioned(
            right: 1.0,
            bottom:7.0,
            child: InkWell(
              onTap: () {
                setState(() {
                  _videoController.value.isPlaying
                      ? _videoController.pause()
                      : _videoController.play();
                });
              },
              child: _videoController.value.isPlaying
                  ? _createIcon(Icons.pause)
                  : _createIcon(
                      Icons.play_arrow,
                    ),
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      primary: false,
      body: Container(
        child: InkWell(
          onTap: () {
            setState(() {
              if (_hidePositioned == 1) {
                  _hidePositioned = 0;
              } else {
                setState(() {
                  _hidePositioned =1;
                });
              }
            });
          },
          child: Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayer(_videoController),
              ),
             Positioned(child: _hidePositioned == 1? _setPositionedInStack(orientation): SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
