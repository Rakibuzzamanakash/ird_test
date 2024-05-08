import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ird_test_1/view/widgets/icon_card.dart';

import '../../resources/app_assets/app_assets.dart';
import '../../resources/app_color/app_colors.dart';
import '../../resources/app_dimension/app_dimension.dart';
import '../../resources/app_string/app_string.dart';

class HomeUpperView extends StatelessWidget {
  const HomeUpperView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: AppDimension(context).height * .498,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColor.appGreenColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppAssets.menuIcon,
                    height: 42,
                    width: 42,
                  ),
                  const Text(
                    AppString.alHadith,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.appWhiteColor),
                  ),
                  Image.asset(
                    AppAssets.searchIcon,
                    height: 42,
                    width: 42,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              CarouselSlider(
                  items: <Widget>[
                    for (var i = 0; i < 5; i++)
                      Column(
                        children: [
                          SizedBox(
                            width: AppDimension(context).width * .9,
                            child: const Text(
                              AppString.aSlave,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColor.appWhiteColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          const Text(
                            AppString.bukhariAndMuslim,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColor.appWhiteColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                  ],
                  options: CarouselOptions(
                    //height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ))
            ],
          ),
        ),
        Positioned(
          bottom: -30,
          child: Container(
            height: AppDimension(context).height * .4,
            width: AppDimension(context).width,
            decoration: const BoxDecoration(
                //color: Colors.yellow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: AssetImage(AppAssets.tracedImage),
                    fit: BoxFit.fill)),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: AppDimension(context).height * .199,
            width: AppDimension(context).width,
            decoration: const BoxDecoration(
                // color: Colors.yellow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: AssetImage(AppAssets.mosqueImage),
                    fit: BoxFit.fill)),
          ),
        ),
        Positioned(
          bottom: -35,
          left: AppDimension(context).width * .099,
          child: Container(
            alignment: Alignment.center,
            height: AppDimension(context).height * .1,
            width: AppDimension(context).width * .8,
            decoration: BoxDecoration(
              color: AppColor.appWhiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BounceInDown(
                    from: 180,
                    duration: const Duration(seconds: 2),
                    child: const IconCard(
                        image: AppAssets.clockIcon, title: AppString.last)),
                BounceInDown(
                    from: 150,
                    duration: const Duration(seconds: 1),
                    child: const IconCard(
                        image: AppAssets.flyIcon, title: AppString.goto)),
                BounceInDown(
                    from: 150,
                    duration: const Duration(seconds: 1),
                    child: const IconCard(
                      image: AppAssets.openBookIcon,
                      title: AppString.apps,
                    )),
                BounceInDown(
                    from: 180,
                    duration: const Duration(seconds: 2),
                    child: const IconCard(
                      image: AppAssets.sadaqaIcon,
                      title: AppString.sadaqa,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
