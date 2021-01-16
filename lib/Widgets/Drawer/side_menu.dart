import 'package:flutter/material.dart';
import 'package:food_admin_side/Widgets/Drawer/desktop_drawer.dart';
import 'package:food_admin_side/Widgets/Drawer/mobile_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: DesktopSideDrawer(),
      tablet: DesktopSideDrawer(),
      mobile: MobileSideDrawer(),
    );
  }
}
