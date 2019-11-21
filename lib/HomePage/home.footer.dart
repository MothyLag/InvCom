import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_events/AddForm/event.request.dart';
import 'package:flutter_events/HomePage/home.page.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:localstorage/localstorage.dart';

class HomeFooterWidget extends StatelessWidget {
  HomeFooterWidget({Key key, this.event, this.share}) : super(key: key);
  final Function share;
  final event;
  final requests = EventRequests();
  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            event["name"],
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 151, 135, 151)),
          ),
          ButtonBar(
            children: <Widget>[
              Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.all(0.0),
                    color: Color.fromARGB(255, 41, 127, 227),
                    icon: Icon(FontAwesomeIcons.shareAlt),
                    onPressed: share,
                  ),
                  IconButton(
                    padding: EdgeInsets.all(0.0),
                    color: Color.fromARGB(255, 227, 41, 41),
                    icon: Icon(FontAwesomeIcons.trash),
                    onPressed: () async {
                      var response = await requests.deleteEvent(event["_id"]);
                      print(response.body);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage(
                                  localStorage: new LocalStorage("token"),
                                  title: "myEvents")));
                    },
                  ),
                ],
              )
            ],
          ),
        ]);
  }
}
