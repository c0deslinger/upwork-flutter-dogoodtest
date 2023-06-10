import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_test/app/global/widget/body_builder.dart';
import 'package:grocery_test/app/modules/controller/grocery_controller.dart';
import 'package:grocery_test/app/modules/model/grocery.dart';
import 'package:grocery_test/style/dimens.dart';
import 'package:grocery_test/app/modules/view/edit_grocery_page.dart';

import 'widget/item_grocery.dart';

class ListGroceriesPage extends StatelessWidget {
  static const routeName = "/list";

  const ListGroceriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title_groceries".tr),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(EditGroceryPage.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(AppDimens.bodyPadding),
        child: GetBuilder<GroceriesControllerImpl>(
          builder: (controller) {
            List<Grocery> groceries = controller.groceries ?? [];
            return BodyBuilder(
              requestStatus: controller.listGroceriesState,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Grocery itemGrocery = groceries[index];
                  return ItemGrocery(
                    grocery: itemGrocery,
                  );
                },
                itemCount: groceries.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
