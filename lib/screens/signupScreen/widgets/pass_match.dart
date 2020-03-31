import 'package:flutter/material.dart';

import '../../../constants.dart';

class IsPassMatching extends StatefulWidget {
  @override
  _IsPassMatchingState createState() => _IsPassMatchingState();
}

class _IsPassMatchingState extends State<IsPassMatching> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Text(
        'Passwords do not match!',
        style: kTextStyle.copyWith(
          color: Colors.red,
        ),
      ),
    );
  }
}
