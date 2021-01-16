import 'package:flutter/material.dart';
import 'package:food_admin_side/Model/product_model.dart';
import 'package:food_admin_side/Services/product_services.dart';

class ProductProvider with ChangeNotifier {
  ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];

  ProductProvider.initialize() {
    loadProduct();
  }
  loadProduct() async {
    products = await _productServices.getProducts();
    notifyListeners();
  }

  double price = 0.0;
  addDiscount(double discount) {
    price += discount;
    notifyListeners();
  }

  removeDiscount(double discount) {
    price -= discount;
    notifyListeners();
  }
}
