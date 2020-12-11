import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductProvider with ChangeNotifier{
  double price ;
  addDiscount(double discount){
    price += discount;
    notifyListeners();

  }
  removeDiscount(double discount){
    price -=discount;
    notifyListeners();
  }
}