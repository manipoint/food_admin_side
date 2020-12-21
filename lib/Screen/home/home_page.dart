import 'package:flutter/material.dart';
import 'package:food_admin_side/Screen/home/desktop.dart';
import 'package:food_admin_side/Screen/home/mobile.dart';
import 'package:food_admin_side/Screen/home/tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileMode(),
      desktop: DeskTop(),
      tablet: TabletMode(),
    );
  }
}
