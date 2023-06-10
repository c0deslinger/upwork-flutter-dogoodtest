import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_test/app/modules/model/grocery.dart';

import '../../../../style/dimens.dart';
import '../edit_grocery_page.dart';

class ItemGrocery extends StatelessWidget {
  const ItemGrocery({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(EditGroceryPage.routeName, arguments: {"grocery": grocery});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimens.componentPadding),
        padding: const EdgeInsets.only(bottom: AppDimens.componentPadding),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 15.0,
                    height: 15.0,
                    margin: const EdgeInsets.only(right: 8.0),
                    color: Color(grocery.category.hexColor),
                  ),
                  Text(grocery.name),
                  const SizedBox(
                    height: AppDimens.componentPadding,
                  )
                ],
              ),
            ),
            Text(grocery.quantity.toString())
          ],
        ),
      ),
    );
  }
}
