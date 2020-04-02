import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/backend.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/card_view.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/frontend.dart';
import '../../constants.dart';

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
                  child: CardView(),
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
                      color: Colors.black54
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
