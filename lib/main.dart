import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_test/app/global/controller/global_controller.dart';
import 'package:grocery_test/app/modules/controller/grocery_controller.dart';
import 'package:grocery_test/app/modules/data/grocery_datasource.dart';
import 'package:grocery_test/style/colors.dart';
import 'package:grocery_test/app/modules/view/list_groceries_page.dart';

import 'app_route.dart';
import 'locale/app_translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.put(GlobalController());
    return GetBuilder<GlobalController>(
        init: globalController,
        builder: (appControllerVal) {
          return GetMaterialApp(
            initialRoute: ListGroceriesPage.routeName,
            getPages: AppRoute.pages,
            locale: appControllerVal.locale,
            translations: AppTranslation(),
            theme: ThemeData(
                primaryColor: AppColors.primaryColorDark,
                brightness: Brightness.dark,
                appBarTheme: const AppBarTheme(
                    color: AppColors.appBarColorDark, elevation: 0),
                scaffoldBackgroundColor: AppColors.backgroundColorDark),
            builder: (context, child) {
              return child!;
            },
          );
        });
  }
}
