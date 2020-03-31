import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'loginScreen/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _animationName = 'animation_1';
  @override
  void initState() {
    super.initState();
    setState(() {
      _animationName = 'animation_1';
    });
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _animationName='';
      });
      Navigator.pushNamed(context, LoginScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            child: Center(child: Image.asset('assets/logo.png')),
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
          ),
          Opacity(
            opacity: 0.25,
            child: Container(
              child: FlareActor(
                'assets/circle.flr',
                alignment: Alignment.center,
                animation: _animationName,
              ),
            ),
          )
        ],
      ),
    );
  }
}
