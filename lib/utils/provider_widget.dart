import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/utils/firebase_auth.dart';

class Provider extends InheritedWidget{
  final AuthProvider auth;
  Provider({Key key, Widget child, this.auth})
      : super(key: key, child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
  static Provider of(BuildContext context)=>(context.inheritFromWidgetOfExactType(Provider)as Provider);
}