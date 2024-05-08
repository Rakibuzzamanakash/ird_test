import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ird_test_1/model/chapter_model.dart';
import 'package:ird_test_1/repository/chapter_repository.dart';

class ChapterController extends GetxController {
  ChapterRepository chapterRepository = ChapterRepository();
  RxList<ChapterModel> chapterDataList = <ChapterModel>[].obs;
  RxList<ChapterModel> originalDataList = <ChapterModel>[].obs;

  TextEditingController searchTitle = TextEditingController();

  getChapterData(int bookId) async {
    chapterDataList
        .assignAll(await chapterRepository.getChaptersByBookId(bookId));
    originalDataList = chapterDataList;
  }

  search(String query) {
    if (query.isEmpty) {
      chapterDataList = originalDataList;
    } else {
      query = query.toLowerCase();
      RxList<ChapterModel> result = <ChapterModel>[].obs;

      for (var element in chapterDataList) {
        var title = element.title.toString().toLowerCase();
        if (title.contains(query)) {
          result.add(element);
        }
      }
      chapterDataList = result;
    }
  }

  @override
  void onClose() {
    searchTitle.clear();
    super.onClose();
  }
}
