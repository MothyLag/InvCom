import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_events/HomePage/home.page.dart';
import 'package:flutter_events/LoginPage/login.form.dart';
import 'package:flutter_events/signUpPage/signUp.page.dart';

class LoginPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("InvCom"),
      ),
      body: LoginFormWidget(),
    );
  }
}
