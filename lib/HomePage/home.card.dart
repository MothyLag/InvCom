import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_events/HomePage/home.footer.dart';

class HomeCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      color: Colors.grey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            "images/picture.png",
            width: 300,
            height: 250,
            color: Colors.black12,
          ),
          Container(
            width: 300,
            height: 50,
            child: HomeFooterWidget(),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
