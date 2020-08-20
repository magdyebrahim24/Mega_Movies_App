import 'package:flutter/material.dart';
import '../screens/videoPlayer/movie_Details.dart';
import '../api/api.dart';

class SearchBox extends SearchDelegate<String> {
  List<String> _listName(var movieMap) {
    List<Map> list = movieMap as List;
    List<String> listName = new List<String>();
    for (int i = 0; i < movie['movie'].length; i++) {
      listName.add('${list[i]['MovieName']}');
    }
    return listName;
  }
  final searchedList = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          color: Theme.of(context).accentColor,
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            color: Theme.of(context).accentColor,
            progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestionList = query.isEmpty
        ? searchedList
        : _listName(movie['movie']).where((p) => p.toUpperCase().
        contains(query.toUpperCase())).toList();
    suggestionList.sort();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              List<String> x = _listName(movie['movie']);
              int y = x.indexOf(suggestionList[index]);
              List list = movie['movie'][y]['actor'] as List;
              List _actors = list.map((i) => ((i))).toList();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MovieDetails(y, _actors)));
            },
            leading: Icon(
              Icons.local_movies,
              color: Theme.of(context).accentColor,
            ),
            title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.teal[200]))
                ])),
          );
        });
  }
}
