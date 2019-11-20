import 'package:flutter/material.dart';
import 'package:flutter_events/LoginPage/login.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPageWidget(),
    );
  }
}
