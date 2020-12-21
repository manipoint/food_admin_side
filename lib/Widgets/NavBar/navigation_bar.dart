import 'package:flutter/material.dart';
import 'package:food_admin_side/Widgets/NavBar/nav_bar_tablet.dart';
import 'package:food_admin_side/Widgets/NavBar/navigationbar_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'naviationbar-mobile.dart';

class NavigationBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
     mobile: NavigationBarMobile(),
      desktop: NavigationBarDesktop(),
      tablet: NavigationBarTablet(),
    );
  }
}