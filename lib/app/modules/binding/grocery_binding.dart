import 'package:get/get.dart';
import 'package:grocery_test/app/modules/controller/grocery_controller.dart';
import 'package:grocery_test/app/modules/data/grocery_datasource.dart';

class GroceryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GroceriesControllerImpl(GroceryDatasourceImpl()),
        fenix: true);
  }
}
