import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Future initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'hadith_bn_test.db');

    final exsist = await databaseExists(path);

    if (exsist) {
      // print("database excist");
      await openDatabase(path);
    } else {
      // print('creating a copy from assets');
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data =
          await rootBundle.load(join('assets', 'hadith_bn_test.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
      //  print('data base coppied');
    }

    await openDatabase(path);
  }
}
