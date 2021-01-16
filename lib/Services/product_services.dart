import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_admin_side/Model/product_model.dart';
import 'package:uuid/uuid.dart';

class ProductServices {
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  String collection = "product";
  void createProduct(Map<String, dynamic> product) {
    var id = Uuid();
    String productId = id.v1();
    product["id"] = productId;
    _firebase.collection(collection).doc(productId).set(product);
  }

  Future<List<ProductModel>> getProducts() async =>
      _firebase.collection(collection).get().then((query) {
        List<ProductModel> prducts = [];
        for(DocumentSnapshot product in query.docs) {
          prducts.add(ProductModel.fromSnapshot(product));
        }
        return prducts;
      });
  // Future updateProduct(Map<String , dynamic> productName)

}
