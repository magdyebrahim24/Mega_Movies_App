import 'package:flutter/material.dart';

class DownLoad extends StatefulWidget {
  @override
  _DownLoadState createState() => _DownLoadState();
}
class _DownLoadState extends State<DownLoad> {

  Widget downloadContent(){
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Icon(Icons.cloud_download,size: 200,color: Colors.teal[100],),
          ),
          SizedBox(
            width: 300,
            child: Text('your downloaded Videos Will be Here',
              style: TextStyle(color: Colors.teal[400],
                   ),
            maxLines: 3 ,
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

      body: downloadContent(),
    );
  }
}
