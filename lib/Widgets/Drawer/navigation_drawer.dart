import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Widgets/Drawer/drawer_items.dart';
import 'package:food_admin_side/Widgets/Drawer/nav_drawer_header.dart';

class CustomNavigationDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: green.withOpacity(.3),
        boxShadow: [
          BoxShadow(blurRadius:16 ,color: white)
        ]
      ),
      child: Column(
        children: [
          NavigationDrawerHeader(),
          DrawerItems(title:'DeshBoard',icon:Icons.dashboard ,route: "home",),
          DrawerItems(title:'Orders',icon:Icons.outlet_rounded ,route: "order",),
          DrawerItems(title:'Categories',icon:Icons.category ,route: "category",),
          DrawerItems(title:'Resturent',icon:Icons.shop ,route: "restaurant",),
          DrawerItems(title:'Add',icon:Icons.add_a_photo ,route: "product",),
        ],
      ),
    );
  }
}