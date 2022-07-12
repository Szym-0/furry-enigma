import 'package:flutter/material.dart';

import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/qr_code.dart';
import '../providers/qr_manager.dart';

class QrScanner extends StatefulWidget {
  static const routeName = '/scanner-screen';

  const QrScanner({Key key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  String _qrInfo = '';
  bool _camState = false;

  _qrCallback(String code) {
    setState(() {
      _camState = false;
      _qrInfo = code;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var qrManager = Provider.of<QrManager>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: _camState
                  ? QRBarScannerCamera(
                      onError: (context, error) => Text(
                        error.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                      qrCodeCallback: (code) {
                        _qrCallback(code);
                      },
                    )
                  : IconButton(
                      iconSize: 100,
                      onPressed: () {
                        setState(() {
                          _camState = true;
                        });
                      },
                      icon: const Icon(
                        Icons.qr_code,
                      ),
                    ),
            ),
          ),
          _qrInfo.isNotEmpty ? Text(_qrInfo) : Container(),
          const SizedBox(
            height: 15,
          ),
          _qrInfo.isEmpty && _camState == true
              ? Container()
              : IconButton(
                  onPressed: () {
                    qrManager.addCode(
                      QrCode(
                        code: _qrInfo,
                        date: DateFormat.jm().format(
                          DateTime.now(),
                        ),
                      ),
                    );
                          Navigator.of(context).pop();

                  },
                  icon: const Icon(Icons.save),
                  iconSize: 50,
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pop(),
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}
