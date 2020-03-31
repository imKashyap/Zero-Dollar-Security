import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';

class CheckBox extends StatefulWidget {
  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool cbVal = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Checkbox(
            activeColor: Colors.blue[700],
            checkColor: Colors.white,
            value: cbVal,
            onChanged: (bool value) {
              setState(() {
                cbVal = value;
              });
            },
          ),
          Text(
            'Remember Me',
            style: kTextStyle,
          ),
        ]),
      ),
    );
  }
}
