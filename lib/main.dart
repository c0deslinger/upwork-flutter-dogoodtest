import 'package:flutter/material.dart';
import 'package:grocery_test/style/colors.dart';
import 'package:grocery_test/view/list_groceries_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Groceries',
      theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          brightness: Brightness.dark,
          appBarTheme:
              const AppBarTheme(color: AppColors.appBarColor, elevation: 0),
          scaffoldBackgroundColor: AppColors.backgroundColor),
      home: const ListGroceriesPage(),
    );
  }
}
