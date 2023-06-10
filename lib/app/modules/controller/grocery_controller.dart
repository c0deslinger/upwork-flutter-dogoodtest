import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_test/app/modules/data/grocery_datasource.dart';

import '../../global/data/states.dart';
import '../model/category.dart';
import '../model/grocery.dart';

abstract class GroceriesController {
  void addGrocery(String name, Category category, int quantity);
  void editGrocery(String id, String name, Category category, int quantity);
  Future<void> deleteGrocery(String id);
  void fetchGroceries();
}

class GroceriesControllerImpl extends GetxController
    implements GroceriesController {
  final GroceryDatasource groceryDatasource;
  GroceriesControllerImpl(this.groceryDatasource);

  RequestStatusState listGroceriesState = RequestStatusState.initial;
  String? errorListGroceries;
  List<Grocery>? groceries;

  @override
  void addGrocery(String name, Category category, int quantity) async {
    try {
      await groceryDatasource.addGrocery(name, category, quantity);
      Get.snackbar("Add Grocery", "Success add grocery");
      fetchGroceries();
    } catch (e) {
      Get.snackbar("Add Failed", "Failed to add grocery");
    }
  }

  @override
  void editGrocery(
      String id, String name, Category category, int quantity) async {
    try {
      await groceryDatasource.editGrocery(id, name, category, quantity);
      Get.snackbar("Edit Grocery", "Item edited");
      fetchGroceries();
    } catch (e) {
      Get.snackbar("Edit Failed", "Failed to edit grocery");
    }
  }

  @override
  Future<void> deleteGrocery(String id) async {
    try {
      groceryDatasource.deleteGrocery(id);
      // Future.delayed(Duration(seconds: 3));
      // Get.snackbar("Delete Grocery", "Item deleted");
      // Future.delayed(Duration(seconds: 3));
      await fetchGroceries();
    } catch (e) {
      Get.snackbar("Delete Failed", "Failed to delete grocery");
    }
  }

  @override
  Future<void> fetchGroceries() async {
    listGroceriesState = RequestStatusState.loading;
    try {
      groceries = await groceryDatasource.fetchGroceries();
      debugPrint("total groceries " + groceries!.length.toString());
      listGroceriesState = RequestStatusState.loaded;
    } catch (e) {
      listGroceriesState = RequestStatusState.failed;
      print(e);
    }
    update();
  }
}
