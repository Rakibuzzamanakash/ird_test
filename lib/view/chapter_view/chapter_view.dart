import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_test_1/app_routs/routes_name.dart';
import 'package:ird_test_1/resources/app_color/app_colors.dart';
import 'package:ird_test_1/resources/app_dimension/app_dimension.dart';
import 'package:ird_test_1/view/hadith_view/hadith_view.dart';
import 'package:ird_test_1/view/widgets/chapter_cart.dart';
import 'package:ird_test_1/view_model/chapter_controller/chapter_controller.dart';

import '../../resources/app_assets/app_assets.dart';
import '../../resources/app_string/app_string.dart';
import '../test/test.dart';

class ChapterView extends StatelessWidget {
  const ChapterView({super.key});

  @override
  Widget build(BuildContext context) {
    final ChapterController chapterController = Get.put(ChapterController());
    final args = Get.arguments;

    return Scaffold(
      //backgroundColor: AppColor.appGrayColor,
      appBar: AppBar(
        backgroundColor: AppColor.appGreenColor,
        automaticallyImplyLeading: false,
        titleSpacing: 10,
        leadingWidth: 20,
        toolbarHeight: 140,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 30),
          child: InkWell(
              onTap: () => Get.back(), child: Image.asset(AppAssets.arrowIcon)),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        args['book_name'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColor.appWhiteColor),
                      ),
                      Text(args['hadis_number'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: AppColor.appWhiteColor)),
                    ],
                  ),
                  Image.asset(AppAssets.threeDotIcon),
                ],
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            alignment: Alignment.center,
            height: AppDimension(context).height * .09,
            width: AppDimension(context).width,
            decoration: const BoxDecoration(
              color: AppColor.appGrayColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: Container(
                width: AppDimension(context).width * .9,
                height: AppDimension(context).height * .15,
                decoration: BoxDecoration(
                    color: AppColor.appWhiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: chapterController.searchTitle,
                  onChanged: chapterController
                      .search(chapterController.searchTitle.text),
                  onTap: () {
                    chapterController.searchTitle.text = '';
                    // chapterController.search(chapterController.searchTitle.text);
                  },
                  decoration: InputDecoration(
                      hintText: AppString.searchChapter,
                      suffixIcon: Image.asset(AppAssets.searchGrayIcon),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.appMediumBlackColor)),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                itemCount: chapterController.chapterDataList.length,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  var value = chapterController.chapterDataList[index];

                  return ChapterCart(
                    action: (){
                      // Get.toNamed(RoutesName.hadithView);
                    },
                    index: index + 1,
                    title:value?.title?.toString() ?? '',
                    hadisRange: value?.hadis_range?.toString() ?? '',
                  );
                }),),
          ),
        ],
      ),
    );
  }
}
