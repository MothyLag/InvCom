import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_events/signUpPage/singUp.form.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrate"),
      ),
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[SignUpForm()],
      ),
    );
  }
}
