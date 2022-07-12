import 'package:flutter/material.dart';

import '../helpers/database_helper.dart';
import '../models/qr_code.dart';

class QrManager with ChangeNotifier {
  List<QrCode> qrcodes = [];

  Future<List<QrCode>> getCodes() async{
     qrcodes = Boxes.getCodes().values.toList();
     return qrcodes;
  }
  Future<void> deleteCode(QrCode qr) async {
    Boxes.getCodes().delete(qr.key);
    notifyListeners();
  }
  Future<void> addCode(QrCode code) async{
    Boxes.getCodes().add(code);
    notifyListeners();
  }
}
