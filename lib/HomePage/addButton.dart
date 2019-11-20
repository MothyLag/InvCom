import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_events/AddForm/addForm.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(
            context: context,
            builder: (context) => Container(
                  child: AddForm(),
                ));
      },
      child: Icon(FontAwesomeIcons.plus),
    );
  }
}
