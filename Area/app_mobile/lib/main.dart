import 'package:flutter/material.dart';
import 'package:no_name/Core.dart';
import 'Login/Login.dart';
import 'Login/V1.dart';
import 'Login/welcomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AREA App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.black45,
        cursorColor: Colors.black45,
        fontFamily: 'OpenSans',
      ),
      home: WelcomePage(),
    );
  }
}
