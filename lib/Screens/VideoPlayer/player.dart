import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  final String videoName;
  Player(this.videoName);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  int _hide = 1;
  VideoPlayerController _videoController;
  double volume = 1.0;
  int _btn = 1;
  @override
  void initState() {
    setState(() {
      _videoController = VideoPlayerController.asset(widget.videoName)
        ..initialize()
        ..setVolume(volume)
        ..setLooping(true);
      //Timer.periodic(Duration(seconds: 10), (timer) {
     //   _hide = 0;
    //   print(_hide);
     // });
    });
    super.initState();
  }

  Widget _icon(IconData a, {Color x = Colors.white70}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 1, left: 4),
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Icon(a, color: x),
      ),
    );
  }

  void method() {
    setState(() {
      if (volume == 1.0) {
        _videoController.setVolume(0.0);
        volume = 0.1;
      } else {
        _videoController.setVolume(1.0);
        volume = 1.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: Container(
        child: InkWell(
          onTap: () {
            setState(() {
              if (_hide == 1) {
                _hide = 0;
              } else {
                _hide = 1;
              }
            });
          },
          child: Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayer(_videoController),
              ),
              _hide == 1
                  ? Positioned(
                      left: 1.0,
                      top: 2.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          _videoController.pause();
                        },
                        child: _icon(
                          Icons.arrow_back_ios,
                        ),
                      ))
                  : SizedBox(),
              _hide == 1
                  ? Positioned(
                      left: 1.0,
                      bottom: 2.0,
                      child: InkWell(
                        onTap: method,
                        child: volume == 1.0
                            ? _icon(
                                Icons.volume_up,
                              )
                            : _icon(
                                Icons.volume_off,
                              ),
                      ))
                  : SizedBox(),
              _hide == 1
                  ? Positioned(
                      right: 1.0,
                      top: 2.0,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              if (_btn == 1) {
                                _btn = 0;
                              } else {
                                _btn = 1;
                              }
                            });
                          },
                          child: _btn == 1
                              ? _icon(Icons.favorite_border, x: Colors.white70)
                              : _icon(Icons.favorite, x: Colors.amberAccent)))
                  : SizedBox(),
              _hide == 1
                  ? Positioned(
                      right: 1.0,
                      bottom: 2,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _videoController.value.isPlaying
                                ? _videoController.pause()
                                : _videoController.play();
                          });
                        },
                        child: _videoController.value.isPlaying
                            ? _icon(Icons.pause)
                            : _icon(
                                Icons.play_arrow,
                              ),
                      ))
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
