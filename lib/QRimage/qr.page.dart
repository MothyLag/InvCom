import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatelessWidget {
  QrCode(Key key, this.id) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return QrImage(
      data: id,
    );
  }
}
