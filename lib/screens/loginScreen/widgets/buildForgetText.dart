import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';

class ForgetText extends StatefulWidget {
  @override
  _ForgetTextState createState() => _ForgetTextState();
}

class _ForgetTextState extends State<ForgetText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      padding: EdgeInsets.symmetric(
          horizontal: 20.0,
      ),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: Text(
          'Forgotten Password?',
          style: kTextStyle,
        ), onTap: () {
          print('Working');
      },
      ),
    );
  }
}
