import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_test_1/resources/app_color/app_colors.dart';
import 'package:ird_test_1/resources/app_string/app_string.dart';
import 'package:ird_test_1/view/home_view/home_upper_view.dart';
import 'package:ird_test_1/view/widgets/book_cart.dart';
import 'package:ird_test_1/view_model/chapter_controller/chapter_controller.dart';
import 'package:ird_test_1/view_model/home_controller/home_controller.dart';

import '../../app_routs/routes_name.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final ChapterController chapterController = Get.put(ChapterController());

    return Scaffold(
      //backgroundColor: AppColor.appGrayColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeUpperView(),
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 10),
              child: Text(
                AppString.allHadithBook,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
            Obx(() => ListView.builder(
                itemCount: homeController.dataList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var value = homeController.dataList[index];
                  return InkWell(
                    onTap: () async {
                      await chapterController.getChapterData(index + 1);
                      Get.toNamed(
                        RoutesName.chapterView,
                        arguments: {
                          "book_name": value.book_name.toString(),
                          "book_id": index+1,
                          "hadis_number": value.number_of_hadis.toString()
                        },
                      );
                    },
                    child: BounceInDown(animate: true,child:  BookCart(
                        color:
                        homeController.fromHex(value.color_code.toString()),
                        abvrCode: value.abvr_code.toString(),
                        bookName: value.book_name.toString(),
                        title: value.title.toString(),
                        numberOfHadis: value.number_of_hadis.toString()),),
                  );
                }),),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
