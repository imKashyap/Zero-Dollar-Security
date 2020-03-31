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
      body: Stack(
        children: <Widget>[
          HeadBack(),
          ListView(
            children: <Widget>[
              Heading(),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 40.0,
                //color:Colors.blue ,
                child: Text(
                  'SIGNUP',
                  style: kTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ),
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
        ],
      ),
    );
  }
}
