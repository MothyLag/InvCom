import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class HomeFooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Evento",
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
                    icon: Icon(FontAwesomeIcons.solidEdit),
                    onPressed: () => print("edit"),
                  ),
                  IconButton(
                    padding: EdgeInsets.all(0.0),
                    color: Color.fromARGB(255, 227, 41, 41),
                    icon: Icon(FontAwesomeIcons.trash),
                    onPressed: () => print("trash"),
                  ),
                ],
              )
            ],
          ),
        ]);
  }
}
