import 'package:flutter/material.dart';
import 'package:flutter_events/LoginPage/login.page.dart';
import 'package:flutter_events/signUpPage/signUp.requests.dart';
import 'package:flutter_events/signUpPage/user.type.dart';
import 'package:toast/toast.dart';

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
        child: Center(
            child: Container(
          width: 200,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "InvCom",
                style: TextStyle(
                    fontSize: 45, color: Colors.white, fontFamily: "Pacifico"),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 15),
                child: TextFormField(
                  onSaved: (value) => {setState(() => _user.name = value)},
                  validator: (value) {
                    return (value.isEmpty) ? "please enter some text" : null;
                  },
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(232, 232, 232, 1.0)),
                      filled: true,
                      hintText: "Nombre completo",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                          borderSide: new BorderSide())),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 15),
                child: TextFormField(
                  onSaved: (value) => {setState(() => _user.email = value)},
                  validator: (value) {
                    return (value.isEmpty) ? "please enter some text" : null;
                  },
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(232, 232, 232, 1.0)),
                      filled: true,
                      hintText: "e-mail",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                          borderSide: new BorderSide())),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 15),
                child: TextFormField(
                  onSaved: (value) => {setState(() => _user.userName = value)},
                  validator: (value) {
                    return (value.isEmpty) ? "please enter some text" : null;
                  },
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(232, 232, 232, 1.0)),
                      filled: true,
                      hintText: "Username",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                          borderSide: new BorderSide())),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 40),
                child: TextFormField(
                  onSaved: (value) => {setState(() => _user.password = value)},
                  validator: (value) {
                    return (value.isEmpty) ? "please enter some text" : null;
                  },
                  decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(232, 232, 232, 1.0)),
                      filled: true,
                      hintText: "password",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10),
                          borderSide: new BorderSide())),
                  obscureText: true,
                ),
              ),
              ButtonTheme(
                minWidth: 1000,
                child: new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text("Registrar"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      var request = new SignUpRequests();
                      request.signUP({
                        "name": _user.name,
                        "email": _user.email,
                        "userName": _user.userName,
                        "password": _user.password
                      }).then((response) => {
                            Toast.show("Usuario creado correctamente", context,
                                backgroundColor: Colors.green,
                                gravity: Toast.TOP,
                                textColor: Colors.white),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPageWidget()))
                          });
                    }
                  },
                ),
              )
            ],
          ),
        )));
  }
}
