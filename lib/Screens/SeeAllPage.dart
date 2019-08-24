import 'package:flutter/material.dart';
import '../MainPages/MainPageCode.dart';
import '../API/Movie_Api.dart';
import '../api/api.dart';
import '../Screens/VideoPlayer/VideoPlayer.dart';


int current = 0;

var list = Movie['movie'][current]['actor'] as List;
var _actors = list.map((i) =>((i))).toList();

class SeeAll extends StatefulWidget {
  @override
  _SeeAllState createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  Widget content() {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
        itemCount: Movie['movie'].length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context,index){
          return InkWell(
            onTap: (){},
            child: Card(
                   child: GridTile(
                     footer: Container(
                       alignment: Alignment.center,
                       height: 45,
                       decoration: BoxDecoration(
                         color: Colors.white10,
                       ),
                       child: Text(ApiList().movieName[index],style: TextStyle(color: Colors.white,
                           fontSize: 16),),
                     ),
                     child: InkWell(
                       onTap: (){
                         setState(() {
                           current=index;
                         });
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPlayer(current, _actors)));
                       },
                       child: Container(
                          decoration: BoxDecoration(color: Colors.teal,
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: AssetImage(Movie['movie'][index]['MovieImg']),
                                fit: BoxFit.fill)
                          ),
                        ),
                     ),
                   ),

              ),
          );
        }
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.teal[400],size: 21,)),

      ),
      body: content(),
    );
  }
}
