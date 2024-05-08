import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';

import '../../resources/app_color/app_colors.dart';
import '../../resources/app_dimension/app_dimension.dart';

class BookCart extends StatelessWidget {
  final Color? color;
  final String abvrCode;
  final String bookName;
  final String title;
  final String numberOfHadis;

  const BookCart(
      {super.key, required this.color,
      required this.abvrCode,
      required this.bookName,
      required this.title, required
      this.numberOfHadis});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Container(
          height: AppDimension(context).height * .086,
          width: AppDimension(context).width * .3,
          decoration: BoxDecoration(
              color: AppColor.appWhiteColor,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: AppDimension(context).width * .46,
                  child: Row(
                    children: [
                      HexagonWidget.pointy(
                        width: 42,
                        //color: Color(0xff1AA483),
                        color: color,
                        cornerRadius: 5,
                        elevation: 2,
                        child: Text(
                           abvrCode,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: AppColor.appWhiteColor),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bookName,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.appDeepBlackColor),
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColor.appMediumBlackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        numberOfHadis,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.appDeepBlackColor),
                    ),
                     const Text(
                    'Hadith',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.appMediumBlackColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
