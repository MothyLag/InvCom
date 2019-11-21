import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_events/HomePage/home.footer.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeCardWidget extends StatelessWidget {
  HomeCardWidget({Key key, this.event}) : super(key: key);
  final globalKey = new GlobalKey();

  final event;
  Future<void> _captureAndSharePng() async {
    try {
      print("pressed");
      print(globalKey.currentContext);
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);
      Share.file("titulo", "nombre.png", pngBytes, "image/png");
      // final channel = const MethodChannel("channel:me.albie.share/share");
      // channel.invokeMethod('shareFile', 'image.png');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      color: Colors.grey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RepaintBoundary(
            key: globalKey,
            child: QrImage(
              backgroundColor: Colors.white,
              data: event["_id"],
              size: 300,
            ),
          ),
          // Image.asset(
          //   "images/picture.png",
          //   width: 300,
          //   height: 250,
          //   color: Colors.black12,
          // ),
          Container(
            width: 300,
            height: 50,
            child: HomeFooterWidget(
              event: event,
              share: _captureAndSharePng,
            ),
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
