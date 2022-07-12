import 'package:hive/hive.dart';
import '../models/qr_code.dart';

class Boxes {
  static Box<QrCode> getCodes() => Hive.box<QrCode>('codes');
}

































// import 'dart:io';

// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// import '../models/qr_code.dart';

// class DatabaseHelper {
//   List<QrCode> qrcodes = [];
//   DatabaseHelper._privateConstructor();

//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   Database _database;
//   Future<Database> get database async => _database ??= await _initDatabase();

//   Future<Database> _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = ('${documentsDirectory.path}qrcodes.db');
//     return await openDatabase(path, version: 1, onCreate: _onCreate);
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute('''CREATE TABLE qrcodes(
//       code TEXT,
//       date TEXT
//     )
//     ''');
//   }

//   Future<List<QrCode>> getCodes() async {
//     Database db = await instance.database;
//     var codes = await db.query('qrcodes', orderBy: 'date');
//     qrcodes =
//         codes.isNotEmpty ? codes.map((e) => QrCode.fromMap(e)).toList() : [];
//     return qrcodes;
//   }

//   Future<void> deleteCode(String date) async {
//     Database db = await instance.database;
//     await db.delete('qrcodes', where: 'date = $date');
//   }

//   Future<int> addCode(QrCode code) async {
//     Database db = await instance.database;
//     return await db.insert('qrcodes', code.toMap());
//   }
// }
