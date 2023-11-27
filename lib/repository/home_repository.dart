
import 'package:ird_test_1/model/books_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';




class HomeRepository{





  Future<List<BookModel>> fetchBookDataFromDatabase() async {
    final dbPath = await getDatabasesPath();
    final path =join(dbPath,'hadith_bn_test.db');
    final Database db = await openDatabase(path);

    final List<Map<String, dynamic>> result = await db.query('books');

    await db.close();


    List<BookModel> dataList = result.map((map) {
      return BookModel(
        id: map['id'],
        title: map['title'],
        title_ar: map['title_ar'],
        number_of_hadis: map['number_of_hadis'],
        abvr_code: map['abvr_code'],
        book_name: map['book_name'],
        book_descr: map['book_descr'],
        color_code: map['color_code'],
      );
    }).toList();

    return dataList;


  }

}