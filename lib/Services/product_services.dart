import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductServices {
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  String collection = "product";
  void createRestaurant(Map<String, dynamic> product){
    var id = Uuid();
    String productId = id.v1();
    product["id"] = productId;
    _firebase.collection(collection).doc(productId).set(product);
  }
}