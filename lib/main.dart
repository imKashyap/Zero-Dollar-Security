import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/screens/aboutZDSScreen/about_zds_screen.dart';
import 'package:zerodollarsecurity/screens/appInfo/appinfo_screen.dart';
import 'package:zerodollarsecurity/screens/contactUsScreen/contactus_screen.dart';
import 'package:zerodollarsecurity/screens/editProfileScreen/editProfileScreen.dart';
import 'package:zerodollarsecurity/screens/homeScreen/home_screen.dart';
import 'package:zerodollarsecurity/screens/login_screen/login_screen.dart';
import 'package:zerodollarsecurity/screens/myAccountScreen/my_account.dart';
import 'package:zerodollarsecurity/screens/signup_screen/signup_screen.dart';
import 'package:zerodollarsecurity/screens/splash_screen/splash_screen.dart';
import 'package:zerodollarsecurity/utils/blocs/provider.dart';
import 'package:zerodollarsecurity/utils/firebase_auth.dart';
import 'package:zerodollarsecurity/utils/provider_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValidatorProvider(
      child: Provider(
        auth: AuthProvider(),
        child: MaterialApp(
          theme: ThemeData.dark(),
          initialRoute: HomeController.id,
          routes: {
            HomeController.id: (context) => HomeController(),
            SplashScreen.id: (context) => SplashScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            SignUpScreen.id: (context) => SignUpScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            MyAccountScreen.id: (context) => MyAccountScreen(),
            EditProfileScreen.id: (context) => EditProfileScreen(),
            ContactUsScreen.id: (context) => ContactUsScreen(),
            AboutZDSScreen.id: (context) => AboutZDSScreen(),
            AppInfoScreen.id: (context) => AppInfoScreen(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Zero Dollar Security',
        ),
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  static String id = 'HomeController';
  @override
  Widget build(BuildContext context) {
    final AuthProvider auth = Provider.of(context).auth;
    return StreamBuilder(
        stream: auth.onAuthStateChanged,
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final bool signedIn = snapshot.hasData;
            return signedIn ? HomeScreen() : LoginScreen();
          }
          return CircularProgressIndicator();
        });
    return Container();
  }
}

//class MainScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder(
//      stream: FirebaseAuth.instance.onAuthStateChanged,
//      builder: (context, AsyncSnapshot<FirebaseUser>snapshot){
//        if(snapshot.connectionState==ConnectionState.waiting)
//          return SplashScreen();
//        if(!snapshot.hasData || snapshot.data==null)
//          return LoginScreen();
//        return ReferralScreen();
//      },
//    );
//  }
//}
