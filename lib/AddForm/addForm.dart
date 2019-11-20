import 'package:flutter/widgets.dart';
import 'package:flutter_events/AddForm/addForm.fields.dart';

class AddForm extends StatefulWidget {
  @override
  AddFormState createState() {
    return AddFormState();
  }
}

class AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: addFormFields(),
    );
  }
}
