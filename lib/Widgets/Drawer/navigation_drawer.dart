import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Routes/routs_name.dart';
import 'package:food_admin_side/Widgets/Drawer/drawer_items.dart';
import 'package:food_admin_side/Widgets/Drawer/nav_drawer_header.dart';

class CustomNavigationDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 230,
      decoration: BoxDecoration(
        color: green.withOpacity(.3),
        boxShadow: [
          BoxShadow(blurRadius:8 ,color: white)
        ]
      ),
      child: Column(
        children: [
          NavigationDrawerHeader(),
          DrawerItems(title:'DeshBoard',icon:Icons.dashboard ,route: HomeRoute,),
          DrawerItems(title:'Orders',icon:Icons.outlet_rounded ,route: OrderRoute,),
          DrawerItems(title:'Categories',icon:Icons.category ,route: CategoryRoute,),
          DrawerItems(title:'Resturent',icon:Icons.shop ,route: RestaurantRoute,),
          DrawerItems(title:'Add',icon:Icons.add_a_photo ,route: ProductRoute,),
        ],
      ),
    );
  }
}