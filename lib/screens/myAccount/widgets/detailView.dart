import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'lorem ipsum',
            style: kTextStyle.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          Text(
            'DESIGNATION',
            style: kTextStyle.copyWith(
              color: Colors.grey[600],
              letterSpacing: 3.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
            child: Divider(
              color: Colors.blue[900],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'ID NO :',
                style: kTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20.0
                ),
              ),
              Text(
                '123456789',
                style: kTextStyle.copyWith(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'EMAIL :',
                style: kTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20.0
                ),
              ),
              Text(
                'you@example.com',
                style: kTextStyle.copyWith(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
