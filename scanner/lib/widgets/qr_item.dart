import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner/providers/qr_manager.dart';

import '../models/qr_code.dart';

class QrItem extends StatefulWidget {
  final QrCode qr;

  const QrItem({Key key, this.qr}) : super(key: key);

  @override
  State<QrItem> createState() => _QrItemState();
}

class _QrItemState extends State<QrItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.qr.code),
      subtitle: Text(widget.qr.date),
      leading: IconButton(
        onPressed: () {Provider.of<QrManager>(context, listen: false).deleteCode(widget.qr);},
        icon: const Icon(
          Icons.delete,
        ),
      ),
    );
  }
}
