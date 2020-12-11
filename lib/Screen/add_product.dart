
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_admin_side/Services/cat_services.dart';
import 'package:food_admin_side/Services/product_services.dart';
import 'package:food_admin_side/Services/resturent_services.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Category _categoryServices = Category();
  Restaurant _restaurantServices = Restaurant();
  ProductServices _productServices = ProductServices();

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  final priceController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Add product")),
    );
  }
}
