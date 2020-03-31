import 'package:flutter/material.dart';
class Frontend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: 70.0,
        decoration: BoxDecoration(
          color: Colors.blue[900],
        ),
        child: Container(
          padding: EdgeInsets.only(left: 100.0, right: 100.0),
          child: Center(
            child: Image.asset('assets/logo.png',
            width: 500.0,),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path>{
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

