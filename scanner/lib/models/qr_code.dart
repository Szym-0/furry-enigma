import 'package:hive/hive.dart';

part 'qr_code.g.dart';

@HiveType(typeId: 0)
class QrCode extends HiveObject {
  @HiveField(0)
  String code;

  @HiveField(1)
  String date;
 
  QrCode({this.code, this.date});

  factory QrCode.fromMap(Map<String, dynamic> json) => QrCode(
        code: json['code'],
        date: json['date'],
      );

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'date': date,
    };
  }
}













//flutter packages pub run build_runner build