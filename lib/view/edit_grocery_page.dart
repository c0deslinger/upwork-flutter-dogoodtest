import 'package:flutter/material.dart';
import 'package:grocery_test/style/button.dart';
import 'package:grocery_test/style/dimens.dart';

import '../model/category.dart';

class EditGroceryPage extends StatefulWidget {
  const EditGroceryPage({super.key});

  @override
  State<EditGroceryPage> createState() => _EditGroceryPageState();
}

class _EditGroceryPageState extends State<EditGroceryPage> {
  Category? _selectedCategory;

  final List<Category> _categories = [
    Category(1, 'Vegetables', 0xFFBBDEFB),
    Category(2, 'Fruit', 0xFF80CBC4),
    Category(3, 'Meat', 0xFFFFCC80),
    Category(4, 'Dairy', 0xFFFFAB91),
    Category(5, 'Sweets', 0xFFE6EE9C),
    Category(6, 'Spices', 0xFFCE93D8),
    Category(7, 'Hygiene', 0xFFB0BEC5),
    Category(8, 'Other', 0xFFC5CAE9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new item"),
      ),
      body: Container(
        padding: const EdgeInsets.all(AppDimens.bodyPadding),
        child: Column(
          children: [
            const TextField(
              maxLength: 50,
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Quantity",
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
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
                      value: _selectedCategory,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCategory = newValue;
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
                  title: "Rest",
                  onClick: () {},
                  isNegativeButton: true,
                ),
                RoundedButton(
                  title: "Add item",
                  onClick: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
