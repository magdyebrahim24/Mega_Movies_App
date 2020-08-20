import 'package:flutter/material.dart';
import 'package:mega/screens/videoPlayer/movie_Details.dart';
import '../api/api.dart';

int current;
var list = movie['movie'][current]['actor'] as List;
var _actors = list.map((i) => ((i))).toList();

class DownLoad extends StatefulWidget {
  @override
  _DownLoadState createState() => _DownLoadState();
}

class _DownLoadState extends State<DownLoad> {

  Widget dowmloadItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: downloadList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                current = downloadList[index];
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieDetails(current, _actors)));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(movie['movie']
                                    [downloadList[index]]['MovieImg']),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                movie['movie'][downloadList[index]]['MovieName'],
                                style: TextStyle(fontSize: 17,color: Theme.of(context).accentColor),
                              ),
                            ),
                            ProgressIndicatorDemo()
                          ],
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget downloadContent() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height / 20,),
          Icon(
              Icons.cloud_download,
              size: 220,
              color: Colors.teal[100],
            ),
          SizedBox(
            width: 280,
            child: Text(
              'your downloaded Videos Will be Here',
              style: TextStyle(
                color: Colors.teal[200],
              ),
              maxLines: 3,
              softWrap: true,
              textAlign: TextAlign.center,
              //textWidthBasis: TextWidthBasis.parent,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: downloadList.length == 0?
            downloadContent():
            dowmloadItem(),
        ),
    );
  }
}

class ProgressIndicatorDemo extends StatefulWidget {
  @override
  _ProgressIndicatorDemoState createState() =>
      new _ProgressIndicatorDemoState();
}

class _ProgressIndicatorDemoState extends State<ProgressIndicatorDemo>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(minutes: 2), vsync: this);
    animation = Tween(begin: 0.0, end: 2.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      height: 3,
      width: 375,
      child: LinearProgressIndicator(
        value: animation.value,
      ),
    ));
  }
}
