import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Restaurant {
FirebaseFirestore _firebase = FirebaseFirestore.instance;
String collection = "restaurant";
void createRestaurant(Map<String, dynamic> restaurant){
  var id = Uuid();
  String restaurantId = id.v1();
  restaurant["id"] = restaurantId;
  _firebase.collection(collection).doc(restaurantId).set(restaurant);
}
}