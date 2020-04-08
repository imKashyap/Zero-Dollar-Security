import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';

class DetailView extends StatefulWidget {
  String name,designation,idno,email;
  DetailView(String name,String designation,String idno,String email){
    this.name=name;
    this.designation=designation;
    this.email=email;
    this.idno=idno;
  }
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '${widget.name}',
            style: TextStyle(
              fontFamily: 'Pacifico',
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
          Text(
            '${widget.designation}',
            style: kTextStyle.copyWith(
              color: Colors.grey[600],
              letterSpacing: 3.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 250.0,
            child: Divider(
              color: Colors.blue[900],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                '${widget.idno}',
                style: kTextStyle.copyWith(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'EMAIL :',
                style: kTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20.0
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(widget.email.length>15?
                      widget.email.substring(0,16):widget.email,
                      style: kTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    widget.email.length>15?Text(
                      '${widget.email.substring(16)}',
                      style: kTextStyle.copyWith(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ):null,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
