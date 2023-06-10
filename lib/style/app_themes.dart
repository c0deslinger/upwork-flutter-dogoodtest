import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
      primaryColor: AppColors.primaryColorLight,
      brightness: Brightness.light,
      appBarTheme:
          const AppBarTheme(color: AppColors.appBarColorLight, elevation: 0),
      scaffoldBackgroundColor: AppColors.backgroundColorLight);

  static final darkTheme = ThemeData(
      primaryColor: AppColors.primaryColorDark,
      brightness: Brightness.dark,
      appBarTheme:
          const AppBarTheme(color: AppColors.appBarColorDark, elevation: 0),
      scaffoldBackgroundColor: AppColors.backgroundColorDark);
}
