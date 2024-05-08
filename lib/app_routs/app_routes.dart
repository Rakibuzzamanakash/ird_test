import 'package:get/get.dart';
import 'package:ird_test_1/app_routs/routes_name.dart';
import 'package:ird_test_1/view/bottomnav/bottomnav.dart';
import 'package:ird_test_1/view/chapter_view/chapter_view.dart';
import 'package:ird_test_1/view/hadith_view/hadith_view.dart';

import '../view/home_view/home_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.bottomNav,
          page: () => BottomNav(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.homeView,
          page: () => const HomeView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.chapterView,
          page: () => const ChapterView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.hadithView,
          page: () => const HadithView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
