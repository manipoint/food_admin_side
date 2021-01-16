import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_admin_side/Helper/constent.dart';
import 'package:food_admin_side/Model/restaurant_model.dart';
import 'package:uuid/uuid.dart';

class RestaurantService {
FirebaseFirestore _firebase = FirebaseFirestore.instance;
String collection = "restaurant";
void createRestaurant(Map<String, dynamic> restaurant){
  var id = Uuid();
  String restaurantId = id.v1();
  restaurant["id"] = restaurantId;
  _firebase.collection(collection).doc(restaurantId).set(restaurant);
}
  Future<List<RestaurantModel>> getAll() async =>
      firebaseFirestore.collection(collection).get().then((result) {
        List<RestaurantModel> restaurants = [];
        for (DocumentSnapshot restaurant in result.docs) {
          restaurants.add(RestaurantModel.fromSnapshot(restaurant));
        }
        return restaurants;
      });
}