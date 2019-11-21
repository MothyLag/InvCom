import 'package:flutter/material.dart';
import 'package:flutter_events/HomePage/addButton.dart';
import 'package:flutter_events/HomePage/home.body.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localstorage/localstorage.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title, this.localStorage}) : super(key: key);

  final LocalStorage localStorage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      floatingActionButton: AddFloatingButton(),
      body: Container(
        child: HomeBodyWidget(
          localStorage: localStorage,
        ),
      ),
    );
  }
}
