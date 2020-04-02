import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/cmn_src/buildHeadBack.dart';
import 'package:zerodollarsecurity/cmn_src/buildHeading.dart';
import 'package:zerodollarsecurity/screens/referralScreen/widgets/buildReferralInput.dart';
import 'package:zerodollarsecurity/screens/referralScreen/widgets/buildReferralSubmit.dart';
import 'package:zerodollarsecurity/screens/referralScreen/widgets/infoText.dart';
import '../../constants.dart';

class ReferralScreen extends StatefulWidget {
  static String id = 'ReferralScreen';
  @override
  _ReferralScreenState createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Heading('VERIFICATION'),
          SizedBox(
            height: 80.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ReferralInput(),
              SizedBox(
                height: 15.0,
              ),
              ReferralSubmit(),
              SizedBox(
                height: 15.0,
              ),
              InfoText(),
            ],
          ),
        ],
      ),
    );
  }
}
