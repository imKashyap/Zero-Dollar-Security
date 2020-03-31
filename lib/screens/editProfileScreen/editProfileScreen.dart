import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';

class EditProfileScreen extends StatefulWidget {
  static String id='EditProfileScreen';
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Edit Profile',
        style: kTextStyle.copyWith(
          color: Colors.white,
        ),),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              print('working');
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                child: Text('SAVE',
                style: kTextStyle.copyWith(
                  color: Colors.white,
                ),),
              ),
            ),
          )
        ],
      ),
      body:MainBody(),
    );
  }
}

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap:(){
                    print('working');
                    createDialogBox(context);
                  },
                  child: Opacity(
                    opacity: 0.5,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('assets/profile.jpeg'),
                    ),
                  ),
                ),
                Center(child: Icon(Icons.add_a_photo),)
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Name',
              style: kTextStyle.copyWith(
                color: Colors.grey,
                fontSize: 18.0
              ),) ,
              TextField(
                style: kTextStyle.copyWith(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
            ],
          )
    );
  }

  createDialogBox(BuildContext context){
    return showDialog(context:context, builder: (context){
      return AlertDialog(
        title: Text('Select Image',
        style: kTextStyle.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text('Open Camera',style: kTextStyle.copyWith(
                  color: Colors.white,
                ),),
                onTap: (){},
              ),
              Padding(
                padding: EdgeInsets.only(top:15.0),
              ),
              GestureDetector(
                child: Text('Choose from Gallery',style: kTextStyle.copyWith(
                  color: Colors.white,
                ),),
                onTap: (){},
              ),
            ],
          ),
        ),
      );
    });
  }
}

