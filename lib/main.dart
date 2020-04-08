import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/screens/aboutZDSScreen/about_zds_screen.dart';
import 'package:zerodollarsecurity/screens/appInfo/appinfo_screen.dart';
import 'package:zerodollarsecurity/screens/contactUsScreen/contactus_screen.dart';
import 'package:zerodollarsecurity/screens/editProfileScreen/editProfileScreen.dart';
import 'package:zerodollarsecurity/screens/homeScreen/home_screen.dart';
import 'package:zerodollarsecurity/screens/loginScreen/login_screen.dart';
import 'package:zerodollarsecurity/screens/myAccountScreen/my_account.dart';
import 'package:zerodollarsecurity/screens/referralScreen/referral_screen.dart';
import 'package:zerodollarsecurity/screens/signinScreen/signIinScreen.dart';
import 'package:zerodollarsecurity/screens/signupScreen/signup_screen.dart';
import 'package:zerodollarsecurity/screens/welcomeScreen/welcome_screen.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute:SignInScreen.id ,
      routes: {
        WelcomeScreen.id: (context)=>WelcomeScreen(),
        SignInScreen.id:(context)=>SignInScreen(),
        LoginScreen.id:(context)=>LoginScreen(),
        SignUpScreen.id:(context)=>SignUpScreen(),
        //HomeScreen.id:(context)=>HomeScreen(),
        ReferralScreen.id:(context)=>ReferralScreen(),
        MyAccountScreen.id:(context)=>MyAccountScreen(),
        EditProfileScreen.id:(context)=>EditProfileScreen(),
        ContactUsScreen.id:(context)=>ContactUsScreen(),
        AboutZDSScreen.id:(context)=>AboutZDSScreen(),
        AppInfoScreen.id:(context)=>AppInfoScreen(),
      },
      debugShowCheckedModeBanner: false,
      title:'Zero Dollar Security',
    );
  }
}

