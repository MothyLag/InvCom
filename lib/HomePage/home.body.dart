import 'package:flutter/material.dart';
import 'package:flutter_events/HomePage/home.card.dart';

class HomeBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: HomeCardWidget(),
    ));
  }
}
