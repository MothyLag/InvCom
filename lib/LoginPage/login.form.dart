import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_events/HomePage/home.page.dart';
import 'package:flutter_events/LoginPage/login.request.dart';
import 'package:flutter_events/signUpPage/signUp.page.dart';
import 'package:flutter_events/signUpPage/user.type.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  _LoginFormState createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginFormWidget> {
  final _user = User();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Center(
          child: Container(
              width: 200,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    onSaved: (value) => {
                      setState(() => {_user.email = value})
                    },
                    validator: (value) =>
                        (value.isEmpty) ? "please fill text" : null,
                    decoration: InputDecoration(labelText: "usuario"),
                  ),
                  TextFormField(
                    onSaved: (value) => {
                      setState(() => {_user.password = value})
                    },
                    validator: (value) =>
                        (value.isEmpty) ? "please fill text" : null,
                    decoration: InputDecoration(labelText: "contraseña"),
                    obscureText: true,
                  ),
                  new RaisedButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text("Entrar"),
                    onPressed: () {
                      var request = new LoginRequest();
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        request.login({
                          "email": _user.email,
                          "password": _user.password
                        }).then((response) =>
                            print("respuesta: " + response.toString()));
                      }
                    },
                  ),
                  new RaisedButton(
                    textColor: Colors.white,
                    color: Colors.grey,
                    child: Text("Registrarse"),
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpPage()))
                    },
                  )
                ],
              )),
        ));
  }
}
