import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Screens/SeeAllPage.dart';
import '../Screens/VideoPlayer/VideoPlayer.dart';
import '../api/api.dart';

List<String> _listImage(var movieMap){
  List<Map> listt =movieMap as List;
  List<String> listImage = new List<String>();
  for(int i=0; i < Movie['movie'].length; i++){
    listImage.add('${listt[i]['MovieImg']}');
  }
return listImage;
}

int _actorIndex=0;
int current;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String _newMovies = 'New Movies';
  String _mostShow = 'Most Show';
  String _arabicMovies = 'Arabic Movies';
  String _topRated = 'Top Rated';
  String _cartoon = 'Cartoon';

  // variable to use it in carusaul slider widget to have index value
  //  Cursor slider the first widget in home screen [ New Movies ]
  Widget carouselSliderWidget(String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15 ),
               child: Row(
                children: <Widget>[
                   Expanded(child: Text(labelText,)),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SeeAll()));
                    },
                    child: seeAllButton(),
                  ),
                ],
            ),
             ),
          CarouselSlider(
            enlargeCenterPage: true,
            autoPlay: true,
            reverse: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 2000),
            pauseAutoPlayOnTouch: Duration(seconds: 3),
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            viewportFraction: .8,
            height: MediaQuery.of(context).size.height / 3.60,
            onPageChanged: (index) {
              setState(() {
                current = index;
              });
            },
            items: _listImage(Movie['movie']).map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: (){
                      setState(() {
                        var list = Movie['movie'][i]['actor'] as List;
                        var _actors = list.map((i) =>((i))).toList();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPlayer(current, _actors)));
                      });
                      },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(image: AssetImage(i),fit: BoxFit.fill)
                      ),
                    ),
                  );
                },
              );
            },
            ).toList(),
          ),
        ],
      ),
    );
  }
  // for every vertical list scroll has items
  Widget verticalScroll(String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15 ),
            child: Row(
              children: <Widget>[
                Expanded(child: Text(labelText,style: TextStyle(fontFamily: 'Comfortaa'),)),
                // for button [ see alll ]
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SeeAll()));
                  },
                  child: seeAllButton(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.70,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Movie['movie'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          var list = Movie['movie'][index]['actor'] as List;
                          var _actors = list.map((i) =>((i))).toList();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoPlayer(index,_actors)));
                        });
                        print(Movie['movie']);
                        print('${Movie['movie'].length},$index,$_actorIndex');
                      },
                      child: Container(
                        width: 140,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(image: AssetImage(Movie['movie'][index]['MovieImg']),fit: BoxFit.fill)
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  // make see all button to see all Movies page
  Widget seeAllButton(){
    return  Container(alignment: Alignment.center,
    width: 80,
    height: 28,
    decoration: BoxDecoration(
    color: Colors.teal[400],
    borderRadius: BorderRadius.circular(30),
    ),
    child: Text('See all',style: TextStyle(color: Colors.white,fontSize: 14),),
    );

  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,

        body: ListView(
          children: <Widget>[
            carouselSliderWidget(_newMovies),
            verticalScroll(_mostShow),
            verticalScroll(_arabicMovies),
            verticalScroll(_topRated),
            verticalScroll(_cartoon),

            // to make space under last List view in the end of screen
            SizedBox(
              height: 15,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),


      );
  }
}
