import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_events/LoginPage/login.form.dart';

class LoginPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(108, 113, 242, 1.0),
        child: LoginFormWidget(),
      ),
    );
  }
}
