import 'package:uuid/uuid.dart';

import '../model/category.dart';
import '../model/grocery.dart';

abstract class GroceryDatasource {
  Future<Grocery> addGrocery(String name, Category category, int quantity);
  Future<Grocery> editGrocery(
      String id, String name, Category category, int quantity);
  void deleteGrocery(String id);
  Future<List<Grocery>> fetchGroceries();
}

class GroceryDatasourceImpl implements GroceryDatasource {
  var uuid = const Uuid();

  List<Grocery> groceryList = [];

  @override
  Future<Grocery> addGrocery(
      String name, Category category, int quantity) async {
    String id = uuid.v4();
    Grocery grocery = Grocery(id, name, quantity, category);
    groceryList.add(grocery);
    return grocery;
  }

  @override
  void deleteGrocery(String id) async {
    groceryList.removeWhere((grocery) => grocery.id == id);
  }

  @override
  Future<Grocery> editGrocery(
      String id, String name, Category category, int quantity) async {
    int index = groceryList.indexWhere((grocery) => grocery.id == id);
    if (index != -1) {
      Grocery editedGrocery = Grocery(id, name, quantity, category);
      groceryList[index] = editedGrocery;
      return editedGrocery;
    } else {
      throw Exception("Grocery not found");
    }
  }

  @override
  Future<List<Grocery>> fetchGroceries() async {
    return groceryList; // Return the list of groceries
  }
}
