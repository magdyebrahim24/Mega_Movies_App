import 'package:flutter/material.dart';
import '../Screens/VideoPlayer/VideoPlayer.dart';
import '../api/api.dart';
import '../api/Movie_Api.dart';

int current = 0;
var list = Movie['movie'][current]['actor'] as List;
var _actors = list.map((i) =>((i))).toList();

class SearchBox extends SearchDelegate<String> {


  List<String> nameList = ApiList().movieName;
  final searchedList = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear),
        onPressed: () {
query='';
        })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress:transitionAnimation), onPressed: (){
          close(context, null);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    return VideoPlayer(current,_actors);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? searchedList :
    nameList .where((p) => p.startsWith(query) ).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
      return ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.local_movies),
        title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
              style: 
            TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),
          children: [TextSpan(
            text: suggestionList[index].substring(query.length),
            style: TextStyle(color: Colors.black26)
          )]
        )),
      );

    });
  }
}