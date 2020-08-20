import 'package:flutter/material.dart';
import '../../sign/sign_In.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(icon:Icon( Icons.arrow_back_ios,color: Theme.of(context).accentColor,),
            onPressed: ()=> Navigator.pop(context)),
        title: Text('Profile',style: TextStyle(color: Theme.of(context).accentColor),),
      ),

      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).accentColor),
                    color: Colors.teal[400],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person_outline,size: 40,color:Theme.of(context).accentColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text ('@User123',style: TextStyle(fontSize: 16,color: Theme.of(context).accentColor),),
                ),
              ],
            ),
          ),

          SizedBox(height: 25,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.person,color: Theme.of(context).accentColor,size: 28,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text ('User',style: TextStyle(color: Theme.of(context).accentColor),),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.mail_outline,color: Theme.of(context).accentColor,size: 28,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text ('User123',style: TextStyle(color: Theme.of(context).accentColor)),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.location_on,color: Theme.of(context).accentColor,size: 28,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text ('City',style: TextStyle(color: Theme.of(context).accentColor)),
                ),
              ],
            ),
          ),


          SizedBox(
            height: MediaQuery.of(context).size.height /4,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child :  Row(
                children: <Widget>[
                  Icon(Icons.arrow_back,color: Theme.of(context).accentColor,size: 28,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text ('Log Out',style: TextStyle(color: Theme.of(context).accentColor)),
                  ),
                ],
              ),
            ),
          ),





        ],
      ),
    );
  }
}
