import 'package:flutter/material.dart';

class SocialOptions extends StatefulWidget {
  @override
  _SocialOptionsState createState() => _SocialOptionsState();
}

class _SocialOptionsState extends State<SocialOptions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap:(){
              print('Working');
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    color: Colors.black26,
                    blurRadius: 6.0,
                  )
                ],
              ),
              child: Image.asset('assets/fb.png'),
            ),
          ),
          GestureDetector(
            onTap:(){
              print('Working');
            },
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    color: Colors.black26,
                    blurRadius: 6.0,
                  )
                ],
              ),
              child: Image.asset('assets/google.png'),
            ),
          ),
        ],
      ),
    );
  }
}
