import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_admin_side/Helper/constent.dart';
import 'package:food_admin_side/Model/category_model.dart';
import 'package:uuid/uuid.dart';

class CategoryServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "category";
  void createCategory(String categoryName) {
    var id = Uuid();
    String categoryId = id.v1();
    _firestore
        .collection(collection)
        .doc(categoryId)
        .set({'category': categoryName});
  }

  Future<List<DocumentSnapshot>> getCategory() =>
      _firestore.collection(collection).get().then((value) => value.docs);

  Future<List<DocumentSnapshot>> getSuggession(String suggession) => _firestore
      .collection(collection)
      .where('category', isEqualTo: suggession)
      .get()
      .then((value) => value.docs);
       Future<List<CategoriesModel>> getAll() async =>
      firebaseFirestore.collection(collection).get().then((result) {
        List<CategoriesModel> categories = [];
        for (DocumentSnapshot category in result.docs) {
          categories.add(CategoriesModel.fromSnapshot(category));
        }
        return categories;
      });
}
