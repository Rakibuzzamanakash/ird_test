import 'package:flutter/material.dart';

import '../../resources/app_color/app_colors.dart';

class IconCard extends StatelessWidget {
  final String image;
  final String title;
  const IconCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image ,
          height: 42,
          width: 42,
        ),
         Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: AppColor.appMediumBlackColor),
        )
      ],
    );
  }
}
