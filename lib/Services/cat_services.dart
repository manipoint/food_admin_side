import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Category {
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
}
