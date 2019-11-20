import 'package:flutter/material.dart';
import 'package:flutter_events/signUpPage/signUp.fields.dart';
import 'package:flutter_events/signUpPage/signUp.requests.dart';
import 'package:flutter_events/signUpPage/user.type.dart';

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final _user = User();
  final _formKey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            onSaved: (value) => {setState(() => _user.name = value)},
            validator: (value) {
              return (value.isEmpty) ? "please enter some text" : null;
            },
            decoration: InputDecoration(labelText: "nombre completo"),
          ),
          TextFormField(
            onSaved: (value) => {setState(() => _user.email = value)},
            validator: (value) {
              return (value.isEmpty) ? "please enter some text" : null;
            },
            decoration: InputDecoration(labelText: "correo electronico"),
          ),
          TextFormField(
            onSaved: (value) => {setState(() => _user.userName = value)},
            validator: (value) {
              return (value.isEmpty) ? "please enter some text" : null;
            },
            decoration:
                InputDecoration(labelText: "elija un nombre de usuario"),
          ),
          TextFormField(
            onSaved: (value) => {setState(() => _user.password = value)},
            validator: (value) {
              return (value.isEmpty) ? "please enter some text" : null;
            },
            decoration: InputDecoration(labelText: "contraseña"),
          ),
          new RaisedButton(
            textColor: Colors.white,
            color: Colors.green,
            child: Text("Registrar"),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print("pressed");
                var request = new SignUpRequests();
                request.signUP({
                  "name": _user.name,
                  "email": _user.email,
                  "userName": _user.userName,
                  "password": _user.password
                }).then((response) => print("respuesta: " + response));
              }
            },
          )
        ],
      ),
    );
  }
}
