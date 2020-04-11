import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/constants.dart';
import 'package:zerodollarsecurity/main.dart';
import 'package:zerodollarsecurity/screens/aboutZDSScreen/about_zds_screen.dart';
import 'package:zerodollarsecurity/screens/contactUsScreen/contactus_screen.dart';
import 'package:zerodollarsecurity/screens/homeScreen/home_screen.dart';
import 'package:zerodollarsecurity/screens/myAccountScreen/my_account.dart';
import 'package:zerodollarsecurity/screens/appInfo/appinfo_screen.dart';
import 'package:zerodollarsecurity/utils/provider_widget.dart';


class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  String name, email;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider
        .of(context)
        .auth
        .getCurrentUser(),
    builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done)
        return CircularProgressIndicator();
      else {
        final user = snapshot.data;
        name = user.displayName;
        email = user.email;
        return Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                ),
                accountName: Text(
                  name,
                  style: kTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                accountEmail: Text(
                  email,
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
                    //backgroundImage: NetworkImage(photoUrl),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  Navigator.pushNamed(context, HomeScreen.id);
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
              InkWell(
                onTap: () async {
                  await Provider
                      .of(context)
                      .auth
                      .signOut();
                  Navigator.of(context).pushReplacementNamed(HomeController.id);
                },
                child: ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.blue),
                  title: Text(
                    'Sign out',
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
    );
  }
}
