import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/backend.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/card_view.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/frontend.dart';
import '../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  static String id = 'ContactUsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.black,
      body: TopTheme(),
    );
  }
}

class TopTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Backend(),
              SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: Center(
                  child: CardView(false),
                ),
              ),
            ],
          ),
          ListView(
            children: <Widget>[
              Frontend(),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 40.0,
                //color:Colors.blue ,
                child: Text(
                  'CONTACT US',
                  style: kTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'We love to \n hear your feedback.',
                      style: kTextStyle.copyWith(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    Container(
                      height: 330.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          contactInfo(
                              Icons.location_on,
                              'Salt Lake Sector V,\nKolkata,West Bengal',
                              Colors.green[500],
                          ),
                          contactInfo(
                              Icons.phone,
                              '+91 62037 93446',
                              Colors.blue,
                          ),
                          contactInfo(
                              Icons.email,
                              'contactus@zerodollarsecurity.in',
                              Colors.redAccent),
                          Text(
                            'We are also available at',
                            style: kTextStyle.copyWith(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                  child:  Icon(FontAwesomeIcons.facebookSquare,color:Colors.blue,size:40),
                                  onTap: () => launch('https://www.facebook.com/zerodollars3curity')
                              ),
                              InkWell(
                                  child:  Icon(FontAwesomeIcons.instagram,color:Colors.purple,size:40),
                                  onTap: () => launch('https://www.instagram.com/zerodollarsecurity'),
                              ),
                              InkWell(
                                  child:  Icon(FontAwesomeIcons.linkedin,color:Colors.blue,size:40),
                                  onTap: () => launch('https://www.linkedin.com/company/zero-dollar-security')
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget contactInfo(IconData icon, String details, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(icon, color: color,
        size: 30.0,),
        SizedBox(
          width: 15.0,
        ),
        Text(
          details,
          style: kTextStyle.copyWith(
            fontSize: 17.0,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
