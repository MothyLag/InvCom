import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_events/AddForm/event.request.dart';
import 'package:flutter_events/HomePage/home.card.dart';
import 'package:localstorage/localstorage.dart';

class CardList extends StatelessWidget {
  final requests = new EventRequests();
  final LocalStorage storage = new LocalStorage("token");

  var events;
  @override
  Widget build(BuildContext context) {
    LocalStorage storage = new LocalStorage("token");
    final request = EventRequests();
    Future<Widget> getEvents() async {
      List<HomeCardWidget> cards = [];
      var response = await requests.getEvents(storage.getItem("token"));
      var events = jsonDecode(response.body);

      print(cards);
      for (var event in events) {
        cards.add(HomeCardWidget(
          event: event,
        ));
      }

      return (cards.length > 0)
          ? ListView(children: cards)
          : Text("no tienes ningun evento :0");
    }

    return FutureBuilder(
      future: getEvents(),
      builder: (context, snapshot) {
        return Container(
            width: 300,
            child: Center(
              child: snapshot.data != null
                  ? snapshot.data
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ));
      },
    );
  }
}
