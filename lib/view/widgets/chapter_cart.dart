import 'package:flutter/material.dart';

import '../../resources/app_color/app_colors.dart';
import '../../resources/app_dimension/app_dimension.dart';

class ChapterCart extends StatelessWidget {
  final int? index;
  final String title;
  final String hadisRange;
  const ChapterCart(
      {super.key,
      required this.index,
      required this.title,
      required this.hadisRange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      child: Card(
        elevation: 0.5,
        child: Container(
          height: AppDimension(context).height * .09,
          width: AppDimension(context).width * .8,
          decoration: BoxDecoration(
              color: AppColor.appWhiteColor,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 21,
                  backgroundColor: AppColor.appGreenColor,
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColor.appWhiteColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: AppDimension(context).width * .65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff5D646F),
                        ),
                      ),
                      Text(
                        hadisRange,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          //color: Color(0xff35353580),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
