import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_events/HomePage/home.page.dart';

class LoginPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("InvCom"),
      ),
      body: Center(
        child: Container(
            width: 200,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "usuario"),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "contraseña"),
                  obscureText: true,
                ),
                new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text("Entrar"),
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage(
                                  title: "InvCom",
                                )))
                  },
                )
              ],
            )),
      ),
    );
  }
}
