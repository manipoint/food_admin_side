import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Screen/home/desktop.dart';
import 'package:food_admin_side/Screen/home/mobile.dart';
import 'package:food_admin_side/Screen/home/tablet.dart';
import 'package:food_admin_side/Widgets/Drawer/navigation_drawer.dart';
import 'package:food_admin_side/Widgets/NavBar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context,sizeingInforamtion) => Scaffold(
        drawer: sizeingInforamtion.deviceScreenType 
        == DeviceScreenType.mobile
        ? CustomNavigationDrawer()
        :null,
        backgroundColor: white,
        body: Center(child: Column(children: [
          NavigationBarCustom(),
          Expanded(
            child: ScreenTypeLayout(mobile: MobileMode(),desktop: DeskTop(),tablet: TabletMode(),),
          )
        ],),)

      ),
    );
  }
}
