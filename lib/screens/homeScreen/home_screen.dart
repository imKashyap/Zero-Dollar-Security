import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/backend.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/card_view.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/detailView.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/frontend.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/qrView.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/side_drawer.dart';
import 'package:zerodollarsecurity/constants.dart';

class HomeScreen extends StatelessWidget {
  String name,email,photoUrl;
  HomeScreen(this.name,this.email,this.photoUrl);
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.black,
      drawer: SideDrawer(name, email,photoUrl),
      body: TopTheme(name, email,photoUrl),
    );
  }
}

class TopTheme extends StatefulWidget {
  String name;
  String email;
  String photoUrl;
  TopTheme(this.name,this.email,this.photoUrl);
  @override
  _TopThemeState createState() => _TopThemeState();
}

class _TopThemeState extends State<TopTheme> {
  bool showQr=false;
  String designation='MEMBER';
  String idno='123456789';
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
                      backgroundImage: NetworkImage(widget.photoUrl),
                    ),
                    radius: 80.0,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  showQr?QRView(widget.name, designation, idno, widget.email):DetailView(widget.name, designation, idno, widget.email),
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