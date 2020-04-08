import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zerodollarsecurity/cmn_src/buildHeading.dart';
import 'package:zerodollarsecurity/screens/homeScreen/home_screen.dart';
import 'package:zerodollarsecurity/screens/referralScreen/widgets/infoText.dart';

final googleSignIn= GoogleSignIn();

class SignInScreen extends StatefulWidget {
  static String id = 'SignInScreen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isAuth = false;
  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((account) {
      print(account);
      handleSignIn(account);
    },
        onError: (err) {
          print('Error signing in: $err');
        });
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account);
    }).catchError((err) {
      print('Error signing in: $err');
    });
  }

  handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      setState(() {
        isAuth = true;
        Navigator.push(context,MaterialPageRoute(
          builder: (context)=>HomeScreen(googleSignIn.currentUser.displayName,googleSignIn.currentUser.email,googleSignIn.currentUser.photoUrl)
        ));
      });
    }
    else {
      setState(() {
        isAuth = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Heading('LOGIN'),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SignInButton(
                  Buttons.GoogleDark,
                  onPressed: login,
                ),
                SizedBox(
                  height: 15.0,
                ),
                InfoText(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }
}

//Scaffold buildAuthScreen() {
//    return Scaffold(body: SafeArea(
//      child: Column(
//        children: <Widget>[
//          Text(googleSignIn.currentUser.displayName),
//          RaisedButton(
//              onPressed: logout,
//              child: Text('Logout')),
//        ],
//      ),
//    ));
//  }
//}

