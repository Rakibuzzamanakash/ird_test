import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexagon/hexagon.dart';

import 'package:ird_test_1/resources/app_color/app_colors.dart';
import 'package:ird_test_1/resources/app_style/app_style.dart';
import 'package:ird_test_1/view_model/chapter_controller/hadith_controller.dart';

import '../../resources/app_assets/app_assets.dart';
import '../../resources/app_dimension/app_dimension.dart';



class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    //final args = Get.arguments;
    final HadithController hadithController = Get.put(HadithController());

    return Scaffold(
      backgroundColor: AppColor.appGrayColor,

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            pinned: true,
            floating: true,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'সহ্হি বুখারী ',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColor.appWhiteColor),
                        ),
                        Text('ওহীর সূচনা অধ্যায় ',
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
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Flexible(
                child: Container(
                  alignment: Alignment.center,
                  height: AppDimension(context).height * .02,
                  width: AppDimension(context).width,
                  decoration: const BoxDecoration(
                    color: AppColor.appGrayColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            expandedHeight: 80,
            backgroundColor: AppColor.appGreenColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded,color: AppColor.appWhiteColor,),
              tooltip: 'Menu',
              onPressed: () {},
            ), //IconButton

          ), //SliverAppBar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              child: ListView.builder(
                  itemCount: hadithController.hadithDataList.length,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    var value = hadithController.hadithDataList[index];
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColor.appWhiteColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15,),
                        child: RichText(text: TextSpan(
                            text: hadithController.englishToBanglaNumber(value.chapter_id.toString())+'/'
                                +hadithController.englishToBanglaNumber(value.section_id.toString())+' অধ্যায়ঃ  ',
                            style: AppTextStyles.style4 ,
                            children: <TextSpan>[
                              TextSpan(
                                  text: value.note.toString(),
                                  style: AppTextStyles.style5
                              )
                            ]
                        )),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColor.appWhiteColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    HexagonWidget.pointy(
                                      width: 35,
                                      color: Color(0xff1AA483),
                                      cornerRadius: 5,
                                      elevation: 2,
                                      child: Text(
                                        "B",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: AppColor.appWhiteColor),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(value.book_name.toString(),style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff5B5B5B)
                                        ),),
                                        SizedBox(height: 2,),
                                        Text(value.hadith_key.toString(),style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff5B5B5B)
                                        ),),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppColor.appGreenColor,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                                        child: Text(value.grade.toString(),style: AppTextStyles.style6),
                                      ),

                                    ),
                                    SizedBox(width: 4,),
                                    Icon(Icons.more_vert_outlined,color: Colors.grey,),
                                  ],
                                )
                              ],
                            ),

                            SizedBox(height: 20,),
                            Text(value.ar.toString(),textAlign: TextAlign.end,
                            style: AppTextStyles.style3,
                            ),
                            SizedBox(height: 15,),
                            Text(value.narrator.toString()+" থেকে বর্ণিত :",
                            style: AppTextStyles.style1,
                            ),
                            SizedBox(height: 10,),
                            Text(value.bn.toString(),style: AppTextStyles.style2,),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                  ],
                );
              }),
            ),
          )//SliverList
        ], //<Widget>[]
      ) ,
    );
  }
}
