import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_events/AddForm/event.request.dart';
import 'package:flutter_events/AddForm/event.type.dart';
import 'package:flutter_events/HomePage/home.page.dart';
import 'package:localstorage/localstorage.dart';

class AddForm extends StatefulWidget {
  @override
  AddFormState createState() {
    return AddFormState();
  }
}

class AddFormState extends State<AddForm> {
  final LocalStorage storage = new LocalStorage('token');
  final _event = Event();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formKey,
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              TextFormField(
                onSaved: (value) => setState(() => _event.name = value),
                validator: (value) =>
                    (value.isEmpty) ? "pleas fill the field" : null,
                decoration: InputDecoration(labelText: "nombre"),
              ),
              TextFormField(
                onSaved: (value) => setState(() => _event.date = value),
                validator: (value) =>
                    (value.isEmpty) ? "pleas fill the field" : null,
                decoration: InputDecoration(labelText: "fecha"),
              ),
              RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text("Agregar"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    var request = new EventRequests();
                    request.addForm({
                      "name": _event.name,
                      "date": _event.date,
                      "image": "nada",
                      "token": storage.getItem("token")
                    }).then((response) => {
                          if (response.body != null)
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage(
                                            title: "myEvents",
                                            localStorage: storage,
                                          )))
                            }
                        });
                  }
                },
              )
            ])));
  }
}
