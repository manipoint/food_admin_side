import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const RESTAURANT = "restaurant";
  static const CATEGORIES = "Categories";
  static const PICTURE = "picture";
  static const OLDPRICE = "old_price";
  static const NEWPRICE = "new_price";
  static const DISCOUNT = "discount";
  static const DESCRIPTION = "description";

  String _id;
  String _name;
  String _restaurant;
  String _categories;
  String _picture;
  String _discription;
  String _discont;
  double _oldprice;
  double _newprice;
  

  String get id => _id;
  String get name => _name;
  String get restaurant => _restaurant;
  String get catrgories => _categories;
  String get picture => _picture;
  String get discout => _discont;
  String get discription => _discription;
  double get oldprice => _oldprice;
  double get newprice => _newprice;
  

  //construtor
  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _id = snapshot.data()[ID];
    _restaurant = snapshot.data()[RESTAURANT];
    _categories = snapshot.data()[CATEGORIES];
    _picture = snapshot.data()[PICTURE];
    _oldprice = snapshot.data()[OLDPRICE];
    _newprice = snapshot.data()[NEWPRICE];
    _discont = snapshot.data()[DISCOUNT];
    _discription = snapshot.data()[DESCRIPTION] ?? "";
  }
}
