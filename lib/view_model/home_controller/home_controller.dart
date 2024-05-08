import 'dart:ui';

import 'package:get/get.dart';
import 'package:ird_test_1/repository/home_repository.dart';

import '../../model/books_model.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository = HomeRepository();
  RxList<BookModel> dataList = <BookModel>[].obs;

  @override
  onInit() {
    super.onInit();
    fetchBookDataFromDatabase();
  }

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  fetchBookDataFromDatabase() async {
    dataList.assignAll(await homeRepository.fetchBookDataFromDatabase());
  }
}
