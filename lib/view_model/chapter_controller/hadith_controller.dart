import 'package:get/get.dart';
import 'package:ird_test_1/model/hadith_model.dart';
import 'package:ird_test_1/repository/hadith_repository.dart';

class HadithController extends GetxController {
  HadithRepository hadithRepository = HadithRepository();
  RxList<HadithModel> hadithDataList = <HadithModel>[].obs;


  getHadithData(int bookId,int chapterId) async {
    hadithDataList
        .assignAll(await hadithRepository.getHadithByBookIdAndChapterId(bookId,chapterId));

  }

  String englishToBanglaNumber(String englishNumber) {
    Map<String, String> numberMap = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };

    return englishNumber.replaceAllMapped(RegExp(r'\d'), (match) {
      return numberMap[match.group(0)] ?? match.group(0)!;
    });
  }

 @override
  void onInit() {
    getHadithData(1, 1);
    super.onInit();
  }
}
