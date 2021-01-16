import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  static const ID = "id";
  static const RESTAURANT = "restaurant";

  String _id;
  String _restaurant;

//  getters
  String get restaurant => _restaurant;
  String get id => _id;

  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot) {
    _restaurant = snapshot.data()[RESTAURANT];
    _id = snapshot.data()[ID];
  }
}