import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';

class PassInput extends StatefulWidget {
  PassInput();
  @override
  _PassInputState createState() => _PassInputState();
}

class _PassInputState extends State<PassInput> {
  _PassInputState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Password',
            style: kTextStyle,
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 50.0,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.blue[700],
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(
                    color: Colors.blue[700]
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(
                    color: Colors.blue[700],
                  ),
                ),
                hintText: 'Password',
                hintStyle: kTextStyle.copyWith(
                  color: Colors.grey,
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
