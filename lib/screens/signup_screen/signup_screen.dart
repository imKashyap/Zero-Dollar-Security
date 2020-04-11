import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:zerodollarsecurity/cmn_src/buildHeading.dart';
import 'package:zerodollarsecurity/screens/login_screen/login_screen.dart';
import 'package:zerodollarsecurity/utils/blocs/bloc.dart';
import 'package:zerodollarsecurity/utils/blocs/provider.dart';
import 'package:zerodollarsecurity/utils/provider_widget.dart';
import '../../constants.dart';
import '../../main.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'SignUpScreen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _nameController;
  String _error;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
    _nameController = TextEditingController(text: '');
  }

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
              Heading('SIGNUP'),
              SizedBox(
                height: 15.0,
              ),
              buildNameInput(),
              SizedBox(
                height: 10.0,
              ),
              buildEmailInput(bloc),
              SizedBox(
                height: 10.0,
              ),
              buildPassInput(bloc),
              SizedBox(
                height: 15.0,
              ),
              buildSubmitButton(bloc),
              SizedBox(
                height: 15.0,
              ),
              buildLoginButton(),
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
              child: Icon(Icons.error_outline),
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
                  icon: Icon(Icons.close),
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

  Widget buildNameInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Name',
            style: kTextStyle,
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 50.0,
            child: TextField(
              controller: _nameController,
              onChanged: (value) {},
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
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
                hintText: 'Your Name',
                hintStyle: kTextStyle.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
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
                    onChanged: bloc.updateEmail,
                    keyboardType: TextInputType.emailAddress,
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

  Widget buildPassInput(Bloc bloc) {
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
            child: StreamBuilder(
                stream: bloc.password,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _passwordController,
                    obscureText: true,
                    onChanged: bloc.updatePassword,
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
                        errorText: snapshot.error,
                        hintText: 'Password',
                        hintStyle: kTextStyle.copyWith(
                          color: Colors.grey,
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget buildSubmitButton(Bloc bloc) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: StreamBuilder(
          stream: bloc.submitValid,
          builder: (context, snapshot) {
            return RaisedButton(
              child: Text(
                'Sign Up',
                style: kTextStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.blue[700],
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: !snapshot.hasData
                  ? null
                  : () async {
                      try {
                        final auth = Provider.of(context).auth;
                        if (_nameController.text == '') {
                          String text = 'Name field can\'t be empty';
                          _showSnackBar(text);
                          return;
                        }
                        String uid = await auth.createUserWithEmail(
                            _emailController.text,
                            _passwordController.text,
                            _nameController.text);
                        Navigator.of(context)
                            .pushReplacementNamed(HomeController.id);
                      } catch (e) {
                        print(e);
                        setState(() {
                          _error = e.message;
                        });
                      }
                    },
            );
          },
        ));
  }

  Widget buildLoginButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, LoginScreen.id);
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Already have an Account?',
                  style: kTextStyle,
                ),
                TextSpan(
                    text: 'Login.',
                    style: kTextStyle.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
