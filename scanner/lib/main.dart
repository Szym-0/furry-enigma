import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

// import 'helpers/database_helper.dart';
import '../providers/qr_manager.dart';
import '../screens/scanner_screen.dart';
import '../screens/start.dart';
import './models/qr_code.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(QrCodeAdapter());
  await Hive.openBox<QrCode>('codes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QrManager()),
      ],
      child: MaterialApp(
        title: 'QR',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Start(),
        routes: {
          Start.routeName: (context) => const Start(),
          QrScanner.routeName: (context) => const QrScanner(),
        },
      ),
    );
  }
}
