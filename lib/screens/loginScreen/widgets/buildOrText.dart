import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';
class OrText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical:5.0
      ),
      alignment: Alignment.center,
      child: Text(
        '-OR-',
        style: kTextStyle.copyWith(
          fontSize: 15.0,
        )
      ),
    );
  }
}