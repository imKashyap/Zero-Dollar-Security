import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';
class SignInWithText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical:5.0
      ),
      alignment: Alignment.center,
      child: Text(
        'Sign in with',
        style: kTextStyle.copyWith(
          fontSize: 15.0,
        )
      ),
    );
  }
}
