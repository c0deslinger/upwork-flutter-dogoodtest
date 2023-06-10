import 'package:flutter/material.dart';
import 'package:grocery_test/style/dimens.dart';
import 'package:grocery_test/view/edit_grocery_page.dart';

class ListGroceriesPage extends StatelessWidget {
  const ListGroceriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditGroceryPage()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(AppDimens.bodyPadding),
      ),
    );
  }
}
