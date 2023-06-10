import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../style/app_themes.dart';

class GlobalController extends GetxController {
  ThemeMode theme = ThemeMode.light;
  Locale locale = const Locale("en");
  String? token;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _getLastSetting();
  }

  Future<void> _getLastSetting() async {
    theme =
        (box.read("isDarkMode") ?? false) ? ThemeMode.dark : ThemeMode.light;
    String systemLang = (window.locale.languageCode == "en" ? "en" : "id");
    // String langCode = box.read("locale") ?? systemLang;
    locale = Locale(systemLang);
    update();
  }

  Future<void> _saveThemeMode(bool isDarkMode) async {
    box.write("isDarkMode", isDarkMode);
    theme = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    update();
  }

  Future<void> changeLanguage(String languageCode) async {
    box.write("locale", languageCode);
    Get.updateLocale(Locale(languageCode));
  }

  void switchTheme() {
    bool isDarkMode = Get.isDarkMode;
    Get.changeTheme(isDarkMode ? AppTheme.lightTheme : AppTheme.darkTheme);
    _saveThemeMode(!isDarkMode);
  }
}
