import 'package:ird_test_1/model/chapter_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ChapterRepository{

  Future<List<ChapterModel>> getChaptersByBookId(int bookId) async {

    final dbPath = await getDatabasesPath();
    final path =join(dbPath,'hadith_bn_test.db');
    final Database db = await openDatabase(path);

    final List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT * FROM chapter WHERE book_id = ?',
      [bookId],
    );

    List<ChapterModel> dataList = result.map((map) {
      return  ChapterModel(
        id: map['id'],
        chapter_id: map["chapter_id"],
        book_id: map["book_id"],
        title: map["title"],
        number:map["number"],
        hadis_range: map["hadis_range"],
        book_name: map["book_name"],
      );
    }).toList();

    return dataList;

  }
}