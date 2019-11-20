import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addFormFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
              decoration: InputDecoration(labelText: "nombre del evento"),
              validator: (value) {
                if (value.isEmpty) {
                  return "please enter some Text";
                } else {
                  return null;
                }
              }),
          TextFormField(
              decoration: InputDecoration(labelText: "fecha del evento"),
              validator: (value) {
                if (value.isEmpty) {
                  return "please enter some Text";
                } else {
                  return null;
                }
              })
        ]);
  }
}
