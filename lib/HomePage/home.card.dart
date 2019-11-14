import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_events/HomePage/home.footer.dart';

class HomeCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Colors.grey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset("images/picture.png", width: 300, height: 250),
          Container(
            width: 300,
            height: 50,
            child: HomeFooterWidget(),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
          ),
          Container(
              width: 300,
              height: 2,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: Offset(1.0, 1.0),
                ),
              ], borderRadius: BorderRadius.all(Radius.circular(10.0))))
        ],
      ),
    );
  }
}
