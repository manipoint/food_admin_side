import 'package:flutter/material.dart';
import 'package:food_admin_side/Screen/home/desktop.dart';
import 'package:food_admin_side/Screen/home/mobile.dart';
import 'package:food_admin_side/Screen/home/tablet.dart';
import 'package:food_admin_side/Widgets/size_constraint_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //final appState = Provider.of<AppProvider>(context);
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(desktop: 1860,watch: 300,tablet: 600),
      mobile: MobileMode(),
      desktop: SizeConstraintWidget(child: DesktopMode(),),
      tablet: TabletMode(),
    );
  }
}
