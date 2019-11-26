import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_events/HomePage/home.page.dart';
import 'package:flutter_events/LoginPage/login.request.dart';
import 'package:flutter_events/signUpPage/signUp.page.dart';
import 'package:flutter_events/signUpPage/user.type.dart';
import 'package:localstorage/localstorage.dart';
import 'package:toast/toast.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  _LoginFormState createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginFormWidget> {
  final LocalStorage storage = new LocalStorage('token');
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
                  Container(
                    margin: EdgeInsetsDirectional.only(bottom: 70),
                    child: Image(
                      image: AssetImage("images/ticket.png"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(bottom: 10),
                    child: TextFormField(
                      onSaved: (value) => {
                        setState(() => {_user.email = value})
                      },
                      validator: (value) =>
                          (value.isEmpty) ? "please fill text" : null,
                      decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(232, 232, 232, 1.0)),
                          filled: true,
                          hintText: "e-mail",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10),
                              borderSide: new BorderSide())),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(bottom: 20),
                    child: TextFormField(
                      onSaved: (value) => {
                        setState(() => {_user.password = value})
                      },
                      validator: (value) =>
                          (value.isEmpty) ? "please fill text" : null,
                      decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(232, 232, 232, 1.0)),
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
                      color: Color.fromRGBO(59, 171, 235, 1.0),
                      child: Text("Entrar"),
                      onPressed: () {
                        var request = new LoginRequest();
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          request.login({
                            "email": _user.email,
                            "password": _user.password
                          }).then((response) => {
                                if (response.body != "false")
                                  {
                                    storage.setItem("token", response.body),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage(
                                                  title: "MyEvents",
                                                  localStorage: storage,
                                                )))
                                  }
                                else
                                  {
                                    print("error"),
                                    Toast.show(
                                        "Usuario y/o contraseña incorrectos",
                                        context,
                                        duration: Toast.LENGTH_SHORT,
                                        gravity: Toast.TOP,
                                        backgroundColor: Colors.red)
                                  }
                              });
                        }
                      },
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 1000,
                    child: new RaisedButton(
                      textColor: Colors.white,
                      color: Colors.grey,
                      child: Text("Registrarse"),
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()))
                      },
                    ),
                  ),
                  Text(
                    "InvCom",
                    style: TextStyle(
                        fontFamily: "Pacifico",
                        color: Colors.white,
                        fontSize: 45),
                  )
                ],
              )),
        ));
  }
}
