import 'package:flutter/material.dart';

import '../../../constants.dart';

class InfoText extends StatefulWidget {
  @override
  _InfoTextState createState() => _InfoTextState();
}

class _InfoTextState extends State<InfoText> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:10.0),
        child: Column(
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'By tapping Submit, you agree to\nZero Dollar Security\'s',
                style: kTextStyle,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    print('working');
                  },
                  child: Text('Terms of Service'
                    ,style:kTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(' & ',
                style:kTextStyle ,),
                GestureDetector(
                  onTap: (){
                    print('working');
                  },
                  child: Text('Privacy Policy.',
                    style:kTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}