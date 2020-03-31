
import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';
import '../../signupScreen/signup_screen.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
            context,SignUpScreen.id);
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Don\'t have an Account?',
                  style: kTextStyle,
                ),
                TextSpan(
                  text: 'Register.',
                  style: kTextStyle.copyWith(
                    fontWeight: FontWeight.bold
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
