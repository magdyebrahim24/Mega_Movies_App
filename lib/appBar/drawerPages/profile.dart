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
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon:Icon( Icons.arrow_back_ios,color: Colors.teal,),
            onPressed: ()=> Navigator.pop(context)),
        title: Text('Profile',style: TextStyle(color: Colors.teal),),
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
                    color: Colors.teal[400],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person_outline,size: 40,color: Colors.teal[200],),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text ('@user_name123',style: TextStyle(fontSize: 16,color: Colors.teal[300]),),
                ),
              ],
            ),
          ),

          SizedBox(height: 25,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.person,color: Colors.teal[500],size: 28,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text ('User Name',),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.mail_outline,color: Colors.teal[500],size: 28,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text ('Email Adress',),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.location_on,color: Colors.teal[500],size: 28,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text ('City',),
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
                  Icon(Icons.arrow_back,color: Colors.teal[500],size: 28,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text ('Log Out',),
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
