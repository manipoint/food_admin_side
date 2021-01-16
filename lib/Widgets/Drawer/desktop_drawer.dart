import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Helper/enmeraors.dart';
import 'package:food_admin_side/Providers/app_provider.dart';
import 'package:food_admin_side/Routes/routs_name.dart';
import 'package:food_admin_side/Widgets/Drawer/drawer_items.dart';
import 'package:food_admin_side/Widgets/Drawer/nav_drawer_header.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DesktopSideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    double containerSize;
    return ResponsiveBuilder(builder: (context, sizeingInformatiom) {
      if (sizeingInformatiom.deviceScreenType == DeviceScreenType.tablet) {
        containerSize = 180;
      } else {
        containerSize = 250;
      }

      return SingleChildScrollView(
        child: Container(
          width: containerSize,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.indigo,
            boxShadow: [
              BoxShadow(
                  blurRadius: 17,
                  color: grey.withOpacity(.2),
                  offset: Offset(
                    3,
                    5,
                  ))
            ],
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.indigo.shade600],
            ),
          ),
          child: Container(
            child: Column(
              children: [
                NavigationDrawersHeader(),
                SizedBox(height: 20,),
                DrawerItems(
                  title: 'DeshBoard',
                  icon: Icons.dashboard,
                  route: HomeRoute,
                  active: appProvider.currentPage == DisplayPage.HOME,
                  page: DisplayPage.HOME,
                ),
                SizedBox(height: 20,),
                DrawerItems(
                  title: 'Orders',
                  icon: Icons.shopping_cart,
                  route: OrderRoute,
                  active: appProvider.currentPage == DisplayPage.ORDERS,
                  page: DisplayPage.ORDERS,
                ),
                SizedBox(height: 20,),
                DrawerItems(
                  title: 'Categories',
                  icon: Icons.category,
                  active: appProvider.currentPage == DisplayPage.CATEGORIES,
                  route: CategoryRoute,
                  page: DisplayPage.CATEGORIES,
                ),
                SizedBox(height: 20,),
                DrawerItems(
                  title: 'Resturent',
                  icon: Icons.shop,
                  active: appProvider.currentPage == DisplayPage.RESTAURANT,
                  route: RestaurantRoute,
                  page: DisplayPage.RESTAURANT,
                ),
                SizedBox(height: 20,),
                DrawerItems(
                  title: 'Products',
                  icon: Icons.shopping_basket_outlined,
                  active: appProvider.currentPage == DisplayPage.PRODUCTS,
                  route: ProductRoute,
                  page: DisplayPage.PRODUCTS,
                ),
                SizedBox(height: 20,),
                DrawerItems(
                  title: 'Users',
                  icon: Icons.people,
                  active: appProvider.currentPage == DisplayPage.USERS,
                  route: UserRoute,
                  page: DisplayPage.USERS,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
