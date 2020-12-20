import 'package:flutter/material.dart';
import 'package:food_admin_side/Widgets/NavBar/nav_bar_items.dart';

import 'nav_bar_logo.dart';

class NavigationBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
        NavBarLogo(),
        NavBarItem(
          
          title: "Home",
          route: "home",),
          NavBarItem(route: "product",title: "AddProduct",),
          NavBarItem(route: "order",title: "Orders",),
          NavBarItem(route: 'category',title: "Categories",),
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: NavBarItem(route: 'restaurant',title: "Add Resturent",),
          )
      ],),
    );
  }
}