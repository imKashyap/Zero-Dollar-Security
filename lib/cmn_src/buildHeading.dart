import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Heading extends StatelessWidget {

  String heading;
  Heading(String heading){
    this.heading=heading;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: MyClipper2(),
          child: Container(
            padding: EdgeInsets.only(left: 20.0),
            height: 220.0,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper1(),
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                ),
                child: Container(
                    padding: EdgeInsets.only(left: 100.0, right: 100.0),
                    child: Center(
                      child: Image.asset(
                        'assets/logo.png',
                        //color: Colors.white,
                      ),
                    )),
              ),
            ),
            Container(
              height: 70.0,
              alignment: Alignment.center,
              child: Text(
                '$heading',
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
    );
  }
}

class MyClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    var firstControlPoint = Offset(50, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width - 50, size.height);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyClipper2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
    path.lineTo(0,size.height-50);
    var firstControlPoint=Offset(50,size.height);
    var firstEndPoint=Offset(size.width/2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint=Offset(size.width-50,size.height);
    var secondEndPoint=Offset(size.width,size.height-50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0.0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}