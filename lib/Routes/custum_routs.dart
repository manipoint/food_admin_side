import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_admin_side/Routes/routs_name.dart';
import 'package:food_admin_side/Screen/AddProduct/add_product_mobile.dart';
import 'package:food_admin_side/Screen/AddProduct/add_product_web.dart';
import 'package:food_admin_side/Screen/add_category.dart';
import 'package:food_admin_side/Screen/add_resturent.dart';
import 'package:food_admin_side/Screen/home/home_page.dart';
import 'package:food_admin_side/Screen/login/login.dart';
import 'package:food_admin_side/Screen/orders.dart';
import 'package:food_admin_side/Screen/signup/signup.dart';
import 'package:food_admin_side/Widgets/Layout/layout.dart';
import 'package:food_admin_side/main.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage());
    case ProductRoute:
      return _getPageRoute(AddProduct());
    case WebProductRoute:
      return _getPageRoute(AddProductWeb());
    case OrderRoute:
      return _getPageRoute(OrdersPage());
    case LoginRoute:
      return _getPageRoute(LoginPage());
    case RestaurantRoute:
      return _getPageRoute(AddRestaurant());
    case LayoutRoute:
      return _getPageRoute(LayoutWidget());

    case SignupRoute:
      return _getPageRoute(SignUp());
    case PageControllerRoute:
      return _getPageRoute(AppPagesController());
    case CategoryRoute:
      return _getPageRoute(AddCategories());
    default:
      return _getPageRoute(LoginPage());
  }
}

PageRoute _getPageRoute(Widget page) {
  return MaterialPageRoute(builder: (context) => page);
}
