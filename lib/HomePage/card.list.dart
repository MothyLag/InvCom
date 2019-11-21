import 'package:flutter/widgets.dart';
import 'package:flutter_events/AddForm/event.request.dart';
import 'package:localstorage/localstorage.dart';

class CardList extends StatelessWidget {
  final requests = new EventRequests();
  final LocalStorage storage = new LocalStorage("token");
  @override
  Widget build(BuildContext context) {
    var cards = requests.getEvents(storage.getItem("token"));
    cards.then((response) => print(response.body));
    return ListView(children: <Widget>[]);
  }
}
