import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/qr_manager.dart';
import '../screens/scanner_screen.dart';
import '../widgets/qr_item.dart';

class Start extends StatefulWidget {
  static const routeName = '/start';

  const Start({Key key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: FutureBuilder(
          future: Provider.of<QrManager>(context).getCodes(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Wystąpił błąd'),
                );
              } else {
                return Consumer<QrManager>(
                  builder: (context, qrData, child) => qrData.qrcodes.isEmpty
                      ? const Center(
                          child: Text('Nie złożono żadnych zamówień'),
                        )
                      : ListView.builder(
                          itemCount: qrData.qrcodes.length,
                          itemBuilder: (ctx, i) => QrItem(
                            qr: qrData.qrcodes[i],
                          ),
                        ),
                );
              }
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, QrScanner.routeName),
        child: const Icon(Icons.add),
      ),
    );
  }
}
