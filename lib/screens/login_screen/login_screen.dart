import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/cmn_src/buildHeading.dart';
import 'package:zerodollarsecurity/main.dart';
import 'package:zerodollarsecurity/screens/signup_screen/signup_screen.dart';
import 'package:zerodollarsecurity/utils/blocs/bloc.dart';
import 'package:zerodollarsecurity/utils/blocs/provider.dart';
import 'package:zerodollarsecurity/utils/provider_widget.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  bool show = true;
  bool cbVal = false;
  String _error;
  _showSnackBar(String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blue,
      content: Text(
        message,
        style: kTextStyle.copyWith(
          color: Colors.black,
        ),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void isHidden() {
    setState(() {
      show = !show;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ValidatorProvider.of(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Heading('LOGIN'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              buildEmailInput(bloc),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              buildPassInput(),
              buildForgetText(),
              buildCheckBox(),
              buildSubmitButton(),
              buildOrText(),
              buildSignInWithText(),
              buildSocialOption(),
              buildRegisterButton(),
            ],
          ),
          showAlert(),
        ],
      ),
    );
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
        margin: EdgeInsets.only(top: 30.0),
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.error_outline,
              color: Colors.black,),
            ),
            Expanded(
              child: AutoSizeText(
                _error,
                style: kTextStyle.copyWith(
                  color: Colors.black,
                ),
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                  icon: Icon(Icons.close,
                  color: Colors.black,),
                  onPressed: () {
                    setState(() {
                      _error = null;
                    });
                  }),
            )
          ],
        ),
      );
    } else
      return SizedBox(
        height: 0.0,
      );
  }

  Widget buildEmailInput(Bloc bloc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Email',
            style: kTextStyle,
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 50.0,
            child: StreamBuilder(
                stream: bloc.email,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: bloc.updateEmail,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.blue[700],
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue[700]),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(
                          color: Colors.blue[700],
                        ),
                      ),
                      errorText: snapshot.error,
                      hintText: 'you@example.com',
                      hintStyle: kTextStyle.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget buildPassInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Password',
            style: kTextStyle,
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
              alignment: Alignment.centerLeft,
              height: 50.0,
              child: TextField(
                controller: _passwordController,
                obscureText: show ? true : false,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue[700],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.blue[700]),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                        color: Colors.blue[700],
                      ),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          (show ? Icons.visibility_off : Icons.visibility),
                          color: Colors.blue[700],
                        ),
                        onPressed: isHidden),
                    hintText: 'Password',
                    hintStyle: kTextStyle.copyWith(
                      color: Colors.grey,
                    )),
              )),
        ],
      ),
    );
  }

  Widget buildForgetText() {
    return Container(
      height: 20.0,
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: Text(
          'Forgot Password?',
          style: kTextStyle,
        ),
        onTap: () {
          showResetPasswordDialog();
        },
      ),
    );
  }

  Widget buildCheckBox() {
    return Container(
      height: 30.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Checkbox(
            activeColor: Colors.blue[700],
            checkColor: Colors.white,
            value: cbVal,
            onChanged: (bool value) {
              setState(() {
                cbVal = value;
              });
            },
          ),
          Text(
            'Remember Me',
            style: kTextStyle,
          ),
        ]),
      ),
    );
  }

  Widget buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: RaisedButton(
        child: Text(
          'Login',
          style: kTextStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Colors.blue[700],
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: () async {
          try {
            final auth = Provider.of(context).auth;
            if (_emailController.text == '' || _passwordController.text == '') {
              String text = 'Email or Password field can\'t be empty';
              _showSnackBar(text);
              return;
            }
            String uid = await auth.signInWithEmail(
                _emailController.text, _passwordController.text);
            Navigator.of(context).pushReplacementNamed(HomeController.id);
          } catch (e) {
            print(e);
            setState(() {
              _error = e.message;
            });
          }
        },
      ),
    );
  }

  Widget buildOrText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      alignment: Alignment.center,
      child: Text('-OR-',
          style: kTextStyle.copyWith(
            fontSize: 15.0,
          )),
    );
  }

  Widget buildSignInWithText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      alignment: Alignment.center,
      child: Text('Sign in with',
          style: kTextStyle.copyWith(
            fontSize: 15.0,
          )),
    );
  }

  Widget buildSocialOption() {
    final auth=Provider.of(context).auth;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          try{
            await auth.loginWithGoogle();
            Navigator.of(context).pushReplacementNamed(HomeController.id);
          }
          catch(e){
            setState(() {
              _error=e.message;
            });
          }
          //   bool res= await AuthProvider().loginWithGoogle();
        },
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                color: Colors.black26,
                blurRadius: 6.0,
              )
            ],
          ),
          child: Image.asset('assets/google.png'),
        ),
      ),
    );
  }

  Widget buildRegisterButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SignUpScreen.id);
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Don\'t have an Account?',
                  style: kTextStyle,
                ),
                TextSpan(
                    text: 'Register.',
                    style: kTextStyle.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showResetPasswordDialog() {
    String input;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text('Reset Password'),
          content: TextField(
            onChanged: (value){
              input=value;
            },
            decoration: InputDecoration(
              hintText: 'Enter registered email',
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Submit'),
              onPressed: () async{
                final auth = Provider.of(context).auth;
                await auth.sendPasswordEmail(input);
                setState(() {
                  _error =
                      'A reset password link has been sent to $input';
                });
                Navigator.of(context).pop(true);
              },
            )
          ]),
    );
  }
}
