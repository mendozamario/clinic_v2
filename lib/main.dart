import 'package:flutter/material.dart';
import 'package:clinic/pages/login/login_screen.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}