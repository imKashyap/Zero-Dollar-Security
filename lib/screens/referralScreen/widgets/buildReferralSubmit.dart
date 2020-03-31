import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';
import 'package:zerodollarsecurity/screens/homeScreen/home_screen.dart';

class ReferralSubmit extends StatefulWidget {
  @override
  _ReferralSubmitState createState() => _ReferralSubmitState();
}

class _ReferralSubmitState extends State<ReferralSubmit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: RaisedButton(
        child: Text(
          'Submit',
          style: kTextStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Colors.blue[700],
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: () {
          Navigator.pushNamed(context, HomeScreen.id);
        },
      ),
    );
  }
}
