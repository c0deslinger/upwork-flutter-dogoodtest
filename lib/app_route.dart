import 'package:get/get.dart';
import 'package:grocery_test/app/modules/binding/grocery_binding.dart';
import 'package:grocery_test/app/modules/view/edit_grocery_page.dart';
import 'package:grocery_test/app/modules/view/list_groceries_page.dart';

class AppRoute {
  static final pages = [
    GetPage(
        name: ListGroceriesPage.routeName,
        page: () => const ListGroceriesPage(),
        bindings: [GroceryBinding()]),
    GetPage(
        name: EditGroceryPage.routeName, page: () => const EditGroceryPage()),
  ];
}
