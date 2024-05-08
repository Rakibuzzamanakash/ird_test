import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ird_test_1/resources/app_assets/app_assets.dart';
import 'package:ird_test_1/resources/app_color/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../view/book_view/book_view.dart';
import '../../view/home_view/home_view.dart';
import '../../view/note_view/note_view.dart';
import '../../view/profile_view/profile_view.dart';
import '../../view/save_view/save_view.dart';

class BottomNavController extends GetxController {
 // late PersistentTabController _controller;
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  Future dbContent() async {
     var dbContent = await rootBundle.load('assets/database/hadith_bn_test.db');
    //var dbContent = await rootBundle.load('assets/database/hadith_db.db');
    return dbContent;
  }

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const BookView(),
      const NoteView(),
      const SaveView(),
      const ProfileView(),
    ];
  }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         AppAssets.homeIcon,
  //       ),
  //       title: "Home",
  //       activeColorPrimary: AppColor.appGreenColor,
  //       inactiveColorPrimary: AppColor.appDeepBlackColor,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         AppAssets.bookIcon,
  //       ),
  //       activeColorSecondary: AppColor.appGreenColor,
  //       title: "Book",
  //       activeColorPrimary: AppColor.appGreenColor,
  //       inactiveColorPrimary: AppColor.appDeepBlackColor,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         AppAssets.noteIcon,
  //       ),
  //       title: "Note",
  //       activeColorPrimary: AppColor.appGreenColor,
  //       inactiveColorPrimary: AppColor.appDeepBlackColor,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         AppAssets.saveIcon,
  //       ),
  //       title: "save",
  //       activeColorPrimary: AppColor.appGreenColor,
  //       inactiveColorPrimary: AppColor.appDeepBlackColor,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         AppAssets.personIcon,
  //       ),
  //       title: "Profile",
  //       activeColorPrimary: AppColor.appGreenColor,
  //       inactiveColorPrimary: AppColor.appDeepBlackColor,
  //     ),
  //   ];
  // }

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: const HomeView(),
      item: ItemConfig(
              icon: SvgPicture.asset(
                AppAssets.homeIcon,
              ),
              title: "Home",
              activeForegroundColor: AppColor.appGreenColor,
              inactiveForegroundColor: AppColor.appDeepBlackColor,
      ),
    ),
    PersistentTabConfig(
      screen: const BookView(),
      item: ItemConfig(
              icon: SvgPicture.asset(
                AppAssets.bookIcon,
              ),
              activeColorSecondary: AppColor.appGreenColor,
              title: "Book",
              activeForegroundColor: AppColor.appGreenColor,
              inactiveForegroundColor: AppColor.appDeepBlackColor,
      ),
    ),
    PersistentTabConfig(
      screen: const NoteView(),
      item: ItemConfig(
      icon: SvgPicture.asset(
          AppAssets.noteIcon,
        ),
        title: "Note",
        activeForegroundColor: AppColor.appGreenColor,
        inactiveForegroundColor: AppColor.appDeepBlackColor,
      ),
    ),
    PersistentTabConfig(
      screen: const SaveView(),
      item: ItemConfig(
              icon: SvgPicture.asset(
                AppAssets.saveIcon,
              ),
              title: "save",
              activeForegroundColor: AppColor.appGreenColor,
              inactiveForegroundColor: AppColor.appDeepBlackColor,
      ),
    ),
    PersistentTabConfig(
      screen: const ProfileView(),
      item: ItemConfig(
      icon: SvgPicture.asset(
          AppAssets.personIcon,
        ),
        title: "Profile",
        activeForegroundColor: AppColor.appGreenColor,
        inactiveForegroundColor: AppColor.appDeepBlackColor,
      ),
    ),
  ];

  //get navBarsItems => _navBarsItems();
  get navBarsItems => _tabs();
  get buildScreens => _buildScreens();
  get controller => _controller;

  @override
  void onInit() {
    super.onInit();
    _controller = PersistentTabController(initialIndex: 0);
  }
}



