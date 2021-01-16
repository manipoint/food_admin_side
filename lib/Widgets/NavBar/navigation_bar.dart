import 'package:flutter/material.dart';
import 'package:food_admin_side/Widgets/NavBar/navigationbar_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'naviationbar-mobile.dart';

class NavigationBarCustom extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldState;

  const NavigationBarCustom({Key key, this.scaffoldState}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(
        scaffoldState: scaffoldState,
      ),
      tablet: NavigationBarDesktop(),
    );
  }
}