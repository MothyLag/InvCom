import 'package:flutter/material.dart';
import 'package:flutter_events/LoginPage/login.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
