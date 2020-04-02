import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/cmn_src/buildHeadBack.dart';
import 'package:zerodollarsecurity/cmn_src/buildHeading.dart';
import 'package:zerodollarsecurity/screens/signupScreen/widgets/buildConfirmPassInput.dart';
import 'package:zerodollarsecurity/screens/signupScreen/widgets/buildNameInput.dart';
import 'package:zerodollarsecurity/screens/signupScreen/widgets/buildPassInput.dart';
import 'package:zerodollarsecurity/screens/signupScreen/widgets/buildSignInSubmit.dart';
import 'package:zerodollarsecurity/screens/signupScreen/widgets/pass_match.dart';
import '../../constants.dart';
import '../loginScreen/widgets/buildEmailInput.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'SignUpScreen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Heading('SIGNUP'),
          SizedBox(
            height: 15.0,
          ),
          NameInput(),
          SizedBox(
            height: 10.0,
          ),
          EmailInput(),
          SizedBox(
            height: 10.0,
          ),
          PassInput(),
          SizedBox(
            height: 10.0,
          ),
          ConfirmPassInput(),
          IsPassMatching(),
          SizedBox(
            height: 15.0,
          ),
          Submit(),
        ],
      ),
    );
  }
}
