import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/cmn_src/buildHeadBack.dart';
import 'package:zerodollarsecurity/cmn_src/buildHeading.dart';
import 'package:zerodollarsecurity/constants.dart';
import 'package:zerodollarsecurity/screens/loginScreen/widgets/buildEmailInput.dart';
import 'package:zerodollarsecurity/screens/loginScreen/widgets/buildForgetText.dart';
import 'package:zerodollarsecurity/screens/loginScreen/widgets/buildOrText.dart';
import 'package:zerodollarsecurity/screens/loginScreen/widgets/buildPassInput.dart';
import 'package:zerodollarsecurity/screens/loginScreen/widgets/buildRegister.dart';
import 'package:zerodollarsecurity/screens/loginScreen/widgets/buildSignInWithText.dart';
import 'package:zerodollarsecurity/screens/loginScreen/widgets/buildSocialOptions.dart';
import 'package:zerodollarsecurity/screens/loginScreen/widgets/buildSubmit.dart';
import 'package:zerodollarsecurity/screens/loginScreen/widgets/build_checkbox.dart';
class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  'LOGIN',
                  style: kTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black54
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              EmailInput(),
              SizedBox(
                height: 10.0,
              ),
              PassInput(),
              ForgetText(),
              CheckBox(),
              Submit(),
              OrText(),
              SignInWithText(),
              SocialOptions(),
              Register(),
            ],
          ),
        ],
      ),
    );
  }
}
