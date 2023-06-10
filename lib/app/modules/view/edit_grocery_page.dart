import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_test/app/global/widget/button.dart';
import 'package:grocery_test/app/modules/controller/grocery_controller.dart';
import 'package:grocery_test/app/modules/model/grocery.dart';
import 'package:grocery_test/style/dimens.dart';

import '../model/category.dart';

class EditGroceryPage extends StatefulWidget {
  static const routeName = "/edit";
  const EditGroceryPage({super.key});

  @override
  State<EditGroceryPage> createState() => _EditGroceryPageState();
}

class _EditGroceryPageState extends State<EditGroceryPage> {
  Category? selectedCategory;

  final List<Category> _categories = [
    Category(1, 'cat_vegetables'.tr, 0xFFBBDEFB),
    Category(2, 'cat_fruit'.tr, 0xFF80CBC4),
    Category(3, 'cat_meat'.tr, 0xFFFFCC80),
    Category(4, 'cat_dairy'.tr, 0xFFFFAB91),
    Category(5, 'cat_sweets'.tr, 0xFFE6EE9C),
    Category(6, 'cat_spices'.tr, 0xFFCE93D8),
    Category(7, 'cat_hygiene'.tr, 0xFFB0BEC5),
    Category(8, 'cat_other'.tr, 0xFFC5CAE9),
  ];

  Grocery? editingGrocery;
  TextEditingController nameController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  GroceriesControllerImpl groceriesController = Get.find();

  @override
  void initState() {
    if (Get.arguments != null) {
      editingGrocery = Get.arguments['grocery'];
      if (editingGrocery != null) {
        nameController.text = editingGrocery!.name;
        qtyController.text = editingGrocery!.quantity.toString();
        selectedCategory = editingGrocery!.category;
      }
    }
    super.initState();
  }

  bool isInputValid(String name, String qty, Category? selectedCategory) {
    if (name.isEmpty) {
      Get.snackbar("err_empty_name_title".tr, "err_empty_name_subtitle".tr);
      return false;
    } else if (qty.isEmpty) {
      Get.snackbar("err_empty_qty_title".tr, "err_empty_qty_subtitle".tr);
      return false;
    } else if (selectedCategory == null) {
      Get.snackbar(
          "err_empty_category_title".tr, "err_empty_category_subtitle".tr);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(editingGrocery == null
            ? "add_item_title".tr
            : "edit_item_title".tr),
      ),
      body: Container(
        padding: const EdgeInsets.all(AppDimens.bodyPadding),
        child: Column(
          children: [
            TextField(
              maxLength: 50,
              controller: nameController,
              decoration: InputDecoration(
                labelText: "name".tr,
                labelStyle: const TextStyle(color: Colors.white),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: qtyController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "quantity".tr,
                      labelStyle: const TextStyle(color: Colors.white),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppDimens.componentPadding),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: DropdownButtonFormField<Category>(
                      focusColor: Colors.white,
                      value: selectedCategory,
                      onChanged: (newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      },
                      items: _categories.map((category) {
                        return DropdownMenuItem<Category>(
                          value: category,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 15.0,
                                height: 15.0,
                                margin: const EdgeInsets.only(right: 8.0),
                                color: Color(category.hexColor),
                              ),
                              Text(category.name),
                              const SizedBox(
                                height: AppDimens.componentPadding,
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: AppDimens.componentPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RoundedButton(
                  title: "Reset",
                  onClick: () {
                    setState(() {
                      selectedCategory = null;
                      nameController.text = "";
                      qtyController.text = "";
                    });
                  },
                  isNegativeButton: true,
                ),
                if (editingGrocery != null)
                  RoundedButton(
                    title: "delete_item_label".tr,
                    onClick: () async {
                      // ));
                      await groceriesController
                          .deleteGrocery(editingGrocery!.id);

                      Get.back();
                    },
                  ),
                RoundedButton(
                  title: editingGrocery == null
                      ? "add_item_label".tr
                      : "save_item_label".tr,
                  onClick: () {
                    if (isInputValid(nameController.text, qtyController.text,
                        selectedCategory)) {
                      if (editingGrocery == null) {
                        groceriesController.addGrocery(nameController.text,
                            selectedCategory!, int.parse(qtyController.text));
                      } else {
                        groceriesController.editGrocery(
                            editingGrocery!.id,
                            nameController.text,
                            selectedCategory!,
                            int.parse(qtyController.text));
                      }
                      Get.back();
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
