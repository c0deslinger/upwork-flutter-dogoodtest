import 'package:flutter/material.dart';
import 'package:grocery_test/style/colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.onClick,
      required this.title,
      this.isNegativeButton = false});

  final Function onClick;
  final String title;
  final bool isNegativeButton;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      textColor: AppColors.buttonTextColor,
      color: isNegativeButton ? Colors.transparent : AppColors.buttonBgColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(title),
    );
  }
}
