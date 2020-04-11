import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:zerodollarsecurity/utils/blocs/validator.dart';

class Bloc extends Object with Validator{
  final _email=BehaviorSubject<String>();
  final _password=BehaviorSubject<String>();

  Stream<String> get email=>_email.stream.transform(validateEmail);
  Function(String) get updateEmail=>_email.sink.add;
  Stream<bool> get submitValid=>Observable.combineLatest2(email, password, (e,p)=>true);

  Stream<String> get password=>_password.stream.transform(validatePassword);
  Function(String) get updatePassword=>_password.sink.add;

  dispose(){
   _email.close();
   _password.close();
  }

  submit(){
    final emailOk=_email.value;
    final passOk=_password.value; 
    print('Email:$emailOk and Password:$passOk');
  }
}
