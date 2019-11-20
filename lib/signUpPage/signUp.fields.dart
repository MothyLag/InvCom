import 'package:flutter/material.dart';
import 'package:flutter_events/signUpPage/user.type.dart';
import 'package:http/http.dart' as http;

class SignUpFields extends StatelessWidget {
  SignUpFields({Key key, this.keyForm, this.setState}) : super(key: key);
  final setState;
  final GlobalKey<FormState> keyForm;
  final _user = User();
  final url = "https://invcom.herokuapp.com/";
  @override
  Widget build(BuildContext context) {}
}
