import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';

class ReferralInput extends StatefulWidget {
  @override
  _ReferralInputState createState() => _ReferralInputState();
}

class _ReferralInputState extends State<ReferralInput> {
  _ReferralInputState();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 50.0,
        child: TextField(
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.blue[700]),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                color: Colors.blue[700],
              ),
            ),
            hintText: 'Enter Your Referral Code',
            hintStyle: kTextStyle.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
