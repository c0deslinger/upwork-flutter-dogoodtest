import 'package:cloud_firestore/cloud_firestore.dart';
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
  final CollectionReference groceriesCollection =
      FirebaseFirestore.instance.collection('groceries');
  var uuid = const Uuid();

  @override
  Future<Grocery> addGrocery(
      String name, Category category, int quantity) async {
    String id = uuid.v4();
    Grocery grocery = Grocery(id, name, quantity, category);

    await groceriesCollection.doc(id).set({
      'name': name,
      'quantity': quantity,
      'category': {
        'id': category.id,
        'name': category.name,
        'hexColor': category.hexColor,
      },
    });

    return grocery;
  }

  @override
  void deleteGrocery(String id) async {
    await groceriesCollection.doc(id).delete();
  }

  @override
  Future<Grocery> editGrocery(
      String id, String name, Category category, int quantity) async {
    await groceriesCollection.doc(id).update({
      'name': name,
      'quantity': quantity,
      'category': {
        'id': category.id,
        'name': category.name,
        'hexColor': category.hexColor,
      },
    });

    return Grocery(id, name, quantity, category);
  }

  @override
  Future<List<Grocery>> fetchGroceries() async {
    QuerySnapshot querySnapshot = await groceriesCollection.get();
    List<Grocery> groceryList = [];

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      String id = documentSnapshot.id;
      String name = data['name'];
      int quantity = data['quantity'];
      Category category = Category(
        data['category']['id'],
        data['category']['name'],
        data['category']['hexColor'],
      );

      Grocery grocery = Grocery(id, name, quantity, category);
      groceryList.add(grocery);
    }

    return groceryList;
  }
}
