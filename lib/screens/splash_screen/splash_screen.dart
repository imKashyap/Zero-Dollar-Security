import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';


class SplashScreen extends StatefulWidget {
  static String id = 'WelcomeScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var connectivity=Connectivity();
  StreamSubscription<ConnectivityResult> subscription;
  String _animationName = 'animation_1';
  @override
  void initState() {
    super.initState();
    subscription=connectivity.onConnectivityChanged.listen((ConnectivityResult result){
      print(result);
      if(result==ConnectivityResult.none){
        showDialog(context: context,
        builder: (context)=> AlertDialog(
          title: Text('No Internet'),
          content: Text('Check your connection'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: (){
                Navigator.of(context).pop(true);
              },
            )
          ],
        ));
      }
    });
    setState(() {
      _animationName = 'animation_1';
    });
//    Future.delayed(Duration(seconds: 3), () {
//      setState(() {
//        _animationName='';
//      });
//      Navigator.pushNamed(context, LoginScreen.id);
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1),
            child: Center(child: Image.asset('assets/logo.png',
            width: MediaQuery.of(context).size.width*0.7,)),
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

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}

