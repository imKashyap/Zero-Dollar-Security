import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';
import 'package:zerodollarsecurity/screens/aboutZDSScreen/about_zds_screen.dart';
import 'package:zerodollarsecurity/screens/contactUsScreen/contactus_screen.dart';
import 'package:zerodollarsecurity/screens/myAccountScreen/my_account.dart';
import 'package:zerodollarsecurity/screens/appInfo/appinfo_screen.dart';
import '../home_screen.dart';

class SideDrawer extends StatefulWidget {
  String name, email, photoUrl;
  SideDrawer(this.name, this.email, this.photoUrl);
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue[900],
            ),
            accountName: Text(
              widget.name,
              style: kTextStyle.copyWith(
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              widget.email,
              style: kTextStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyAccountScreen.id);
              },
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(widget.photoUrl),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                          widget.name, widget.email, widget.photoUrl)));
            },
            child: ListTile(
                leading: Icon(Icons.person, color: Colors.blue),
                title: Text(
                  'My Profile',
                  style: kTextStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ContactUsScreen.id);
            },
            child: ListTile(
              leading: Icon(Icons.phone, color: Colors.blue),
              title: Text(
                'Contact Us',
                style: kTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AboutZDSScreen.id);
            },
            child: ListTile(
              leading: Icon(Icons.info_outline, color: Colors.blue),
              title: Text(
                'About Us',
                style: kTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyAccountScreen.id);
            },
            child: ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text(
                'Settings',
                style: kTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppInfoScreen.id);
            },
            child: ListTile(
              leading: Icon(
                Icons.help,
                color: Colors.blue,
              ),
              title: Text(
                'App Info',
                style: kTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
