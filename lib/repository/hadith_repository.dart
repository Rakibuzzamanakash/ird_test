import 'package:ird_test_1/model/hadith_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HadithRepository{

  Future<List<HadithModel>> getHadithByBookIdAndChapterId(int bookId,int chapterId) async {

    final dbPath = await getDatabasesPath();
    final path =join(dbPath,'hadith_db.db');
    final Database db = await openDatabase(path);

    final List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT * FROM hadith WHERE book_id = ? AND chapter_id = ?',
       [bookId,chapterId],
    );

    List<HadithModel> dataList = result.map((map) {
      return  HadithModel(
        id: map["id"],
        chapter_id: map["chapter_id"],
        book_id: map["book_id"],
        title: map["title"],
        number: map["number"],
        book_name: map["book_name"],
        section_id: map["section_id"],
        hadith_key: map["hadith_key"],
        hadith_id: map["hadith_id"],
        narrator: map["narrator"],
        bn: map["bn"],
        ar:map["ar"],
        ar_diacless: map["ar_diacless"],
        grade_id: map["grade_id"],
        grade: map["grade"],
        grade_color: map["grade_color"],
        note: map["note"],
      );
    }).toList();

    return dataList;

  }
}