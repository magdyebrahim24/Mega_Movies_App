import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: TextStyle(  color: Theme.of(context).accentColor,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Theme.of(context).accentColor,size: 21,)),

      ),

      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Cookies usually are the trickiest part of making your website compliant with regulations for privacy and data protection.Most of the other data collection activities going on in connection to your website are both static and visible: The contact form or newsletter-subscription only changes if you actively make changes to it, and the user is aware of giving personal information when they chose to fill them out.Cookies, on the other hand, operate in the background.They are quietly dropped on the user’s computer without the user (or sometimes even the website owner, for that sake) being aware of what is going on.',
              style: TextStyle(  color: Theme.of(context).accentColor,fontSize: 16
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Privacy policy and GDPR The General Data Protection Regulation requires that the communication about the use of data is both specific and accurate. This means, in practice, that whereas the remainder of the privacy policy may be a static document, the section on cookies should be updated fairly regularly. This issue can be solved if you choose a cookie solution like Cookiebot for your website.Cookiebot performs monthly scans of your website, giving a complete overview of the cookies in use.',
              style: TextStyle(  color: Theme.of(context).accentColor,fontSize: 16
              ),
            ),
          ),
        ],
      ),

    );
  }
}
