import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ird_test_1/resources/app_assets/app_assets.dart';
import 'package:ird_test_1/resources/app_color/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../view/book_view/book_view.dart';
import '../../view/home_view/home_view.dart';
import '../../view/note_view/note_view.dart';
import '../../view/profile_view/profile_view.dart';
import '../../view/save_view/save_view.dart';

class BottomNavController extends GetxController {
  late PersistentTabController _controller;

  Future dbContent() async {
    var dbContent = await rootBundle.load('assets/database/hadith_bn_test.db');
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

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.homeIcon,
        ),
        title: "Home",
        activeColorPrimary: AppColor.appGreenColor,
        inactiveColorPrimary: AppColor.appDeepBlackColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.bookIcon,
        ),
        activeColorSecondary: AppColor.appGreenColor,
        title: "Book",
        activeColorPrimary: AppColor.appGreenColor,
        inactiveColorPrimary: AppColor.appDeepBlackColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.noteIcon,
        ),
        title: "Note",
        activeColorPrimary: AppColor.appGreenColor,
        inactiveColorPrimary: AppColor.appDeepBlackColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.saveIcon,
        ),
        title: "save",
        activeColorPrimary: AppColor.appGreenColor,
        inactiveColorPrimary: AppColor.appDeepBlackColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.personIcon,
        ),
        title: "Profile",
        activeColorPrimary: AppColor.appGreenColor,
        inactiveColorPrimary: AppColor.appDeepBlackColor,
      ),
    ];
  }

  get navBarsItems => _navBarsItems();
  get buildScreens => _buildScreens();
  get controller => _controller;

  @override
  void onInit() {
    super.onInit();
    _controller = PersistentTabController(initialIndex: 0);
  }
}
