import 'package:flutter/material.dart';
import 'bloc.dart';

class ValidatorProvider extends InheritedWidget {
  final bloc = Bloc();
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  ValidatorProvider({Key key, Widget child}) : super(key: key, child: child);
  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ValidatorProvider)
            as ValidatorProvider)
        .bloc;
  }
}
