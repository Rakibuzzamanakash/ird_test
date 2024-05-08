import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ird_test_1/view/hadith_view/hadith_view.dart';

import 'app_routs/app_routes.dart';
import 'app_routs/routes_name.dart';
import 'data/database_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialRoute: RoutesName.bottomNav,
      // getPages: AppRoutes.appRoutes(),
      home: HadithView(),
    );
  }
}


