import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/screens/editProfileScreen/editProfileScreen.dart';
import 'package:zerodollarsecurity/screens/homeScreen/home_screen.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/backend.dart';
import 'package:zerodollarsecurity/screens/homeScreen/widgets/frontend.dart';
import 'package:zerodollarsecurity/screens/myAccount/widgets/cardView.dart';
import 'package:zerodollarsecurity/screens/myAccount/widgets/detailView.dart';
import '../../constants.dart';

class MyAccountScreen extends StatelessWidget {
  static String id = "MyAccountScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, HomeScreen.id);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.black,
      body: MainTheme(),
    );
  }
}

class MainTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, EditProfileScreen.id);
        },
        backgroundColor: Colors.blue[900],
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Backend(),
              SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: CardView(),
              ),
              ],),
              ListView(
                children: <Widget>[
                  Frontend(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 40.0,
                    //color:Colors.blue ,
                    child: Text(
                      'SETTINGS',
                      style: kTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black54
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 30.0),
                          child: CircleAvatar(
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage('assets/profile.jpeg'),
                            ),
                            radius: 55.0,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        DetailView(),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
    );
  }
}
