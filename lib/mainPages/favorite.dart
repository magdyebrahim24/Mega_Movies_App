import 'package:flutter/material.dart';
import 'package:mega/screens/videoPlayer/movie_Details.dart';
import '../api/api.dart';

int current;
var list = movie['movie'][current]['actor'] as List;
var _actors = list.map((i) =>((i))).toList();

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  Widget favItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 3),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: favList.length,
          itemBuilder: (context , index)=>InkWell(
            onTap: (){
              setState(() {
                current = favList[index];
              });
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetails(current, _actors)));
            },
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(image: AssetImage(movie['movie'][favList[index]]['MovieImg']),fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(movie['movie'][favList[index]]['MovieName'],
                          style: TextStyle(fontSize: 17,color: Theme.of(context).accentColor),),
                        Padding(
                          padding: const EdgeInsets.only(top: 5,),
                          child: SizedBox(
                            width: 230,
                            child: Text(movie['movie'][favList[index]]['Description'],
                              textAlign: TextAlign.center,
                              maxLines: 6,
                              style: TextStyle(fontSize: 12,color: Theme.of(context).accentColor),),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          favList.length == 0?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 120,
              ),
              Icon(Icons.favorite,
                  size: 250, color: Colors.teal[100]),
              Text(
                'Your Favorite Movies Will Be Her',
                style: TextStyle(
                  color: Colors.teal[200],
                ),
              ),
            ],
          ):
          favItem(),
        ],
      ),
    );
  }
}
