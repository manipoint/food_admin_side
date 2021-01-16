import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_admin_side/Helper/constent.dart';
import 'package:food_admin_side/Model/orders_model.dart';

class OrderServices {
  String collection = "orders";
 Future<List<OrderModel>> getAllOrders() async =>
      firebaseFirestore.collection(collection).get().then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.docs) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });
}
