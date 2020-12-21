import 'package:flutter/material.dart';
import 'package:food_admin_side/Routes/routs_name.dart';
import 'package:food_admin_side/Widgets/NavBar/nav_bar_items.dart';

import 'nav_bar_logo.dart';

class NavigationBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBarLogo(),
          NavBarItem(
          route: HomeRoute,
          title: "Home",),
          NavBarItem(
            route: WebProductRoute,
            title: "AddProduct",
          ),
          NavBarItem(
            route: OrderRoute,
            title: "Orders",
          ),
          NavBarItem(
            route: CategoryRoute,
            title: "Categories",
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: NavBarItem(
              route: RestaurantRoute,
              title: "Add Resturent",
            ),
          )
        ],
      ),
    );
  }
}
