import 'package:flutter/material.dart';
import 'package:clinic/pages/login/body_login_screen.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light
    ));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Body(),
    );
  }

  Widget buildLogin() {
    return Container(
      color: Colors.blue,
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.lightBlue,
          ),
          Container(
            color: Colors.white,
            width: 500,
            height: 500,
          ),
        ],
      ),
    );
  }
}