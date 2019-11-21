import 'package:flutter/material.dart';
import 'package:flutter_events/HomePage/card.list.dart';
import 'package:flutter_events/HomePage/home.card.dart';
import 'package:localstorage/localstorage.dart';

class HomeBodyWidget extends StatelessWidget {
  HomeBodyWidget({Key key, this.localStorage}) : super(key: key);
  final LocalStorage localStorage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: CardList(),
    ));
  }
}
