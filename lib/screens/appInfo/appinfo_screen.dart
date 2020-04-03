import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/backend.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/card_view.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/frontend.dart';
import '../../constants.dart';

class AppInfoScreen extends StatelessWidget {
  static String id = 'AppInfoScreen';
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
                  'DEVELOPER INFO',
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Version : 1.0',
                      style: kTextStyle.copyWith(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 230.0,
                            child: Image.asset(
                              'assets/developer.png',
                            ),
                          ),
                          Text(
                            'Developer(s)',
                            style: kTextStyle.copyWith(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Rahul Kashyap',
                            style: kTextStyle.copyWith(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Mohini Gupta',
                            style: kTextStyle.copyWith(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
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
}
