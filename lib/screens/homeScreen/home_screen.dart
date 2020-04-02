import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/backend.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/card_view.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/detailView.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/frontend.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/qrView.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/side_drawer.dart';
import 'package:zerodollarsecurity/constants.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.black,
      drawer: SideDrawer(),
      body: TopTheme(),
    );
  }
}

class TopTheme extends StatefulWidget {
  @override
  _TopThemeState createState() => _TopThemeState();
}

class _TopThemeState extends State<TopTheme> {
  bool showQr=false;
  String name='lorem ipsum';
  String designation='DESIGNATION';
  String idno='123456789';
  String email='you@example.com';
  String bottomText='QR';
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
          Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Frontend(),
                  SizedBox(
                    height: 20.0,
                  ),
                  CircleAvatar(
                    child: CircleAvatar(
                      radius: 75.0,
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('assets/profile.jpeg'),
                    ),
                    radius: 80.0,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  showQr?QRView(name, designation, idno, email):DetailView(name, designation, idno, email),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showQr=!showQr;
                        bottomText=(bottomText=='Id')?'QR':'Id';
                      });
                    },
                    child: Container(
                      height: 80.0,
                      color: Colors.blue[900],
                      child: Center(
                        child: Text(
                          'Tap for $bottomText',
                          style: kTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}