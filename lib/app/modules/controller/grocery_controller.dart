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
  void onInit() {
    fetchGroceries();
    super.onInit();
  }

  @override
  void addGrocery(String name, Category category, int quantity) async {
    try {
      await groceryDatasource.addGrocery(name, category, quantity);
      Get.snackbar(
          "add_grocery_snackbar_title".tr, "add_grocery_snackbar_subtitle".tr);
      fetchGroceries();
    } catch (e) {
      Get.snackbar("add_grocery_snackbar_failed_title".tr,
          "add_grocery_snackbar_failed_subtitle".tr);
    }
  }

  @override
  void editGrocery(
      String id, String name, Category category, int quantity) async {
    try {
      await groceryDatasource.editGrocery(id, name, category, quantity);
      Get.snackbar("edit_grocery_snackbar_title".tr,
          "edit_grocery_snackbar_subtitle".tr);
      fetchGroceries();
    } catch (e) {
      Get.snackbar("edit_grocery_snackbar_failed_title".tr,
          "edit_grocery_snackbar_failed_subtitle".tr);
    }
  }

  @override
  Future<void> deleteGrocery(String id) async {
    try {
      groceryDatasource.deleteGrocery(id);
      await fetchGroceries();
    } catch (e) {
      Get.snackbar("delete_grocery_snackbar_failed_title".tr,
          "delete_grocery_snackbar_failed_subtitle".tr);
    }
  }

  @override
  Future<void> fetchGroceries() async {
    listGroceriesState = RequestStatusState.loading;
    try {
      groceries = await groceryDatasource.fetchGroceries();
      listGroceriesState = RequestStatusState.loaded;
    } catch (e) {
      listGroceriesState = RequestStatusState.failed;
      Get.snackbar("fetch_grocery_snackbar_failed_title".tr,
          "fetch_grocery_snackbar_failed_subtitle".tr);
    }
    update();
  }
}
