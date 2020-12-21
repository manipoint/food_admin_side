import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Routes/custum_routs.dart';
import 'package:food_admin_side/Routes/routs_name.dart';
import 'package:food_admin_side/Services/navigation_sevice.dart';
import 'package:food_admin_side/Widgets/Drawer/navigation_drawer.dart';
import 'package:food_admin_side/Widgets/NavBar/navigation_bar.dart';
import 'package:food_admin_side/locator.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeingInforamtion) => Scaffold(
          drawer: sizeingInforamtion.deviceScreenType == DeviceScreenType.mobile
              ? CustomNavigationDrawer()
              : null,
          backgroundColor: green.withOpacity(.2),
          body: Center(
            child: Column(
              children: [
                NavigationBarCustom(),
                Expanded(
                  child: Navigator(
                    key: locator<NavigationService>().navigatorKey,
                    onGenerateRoute: generateRoute,
                    initialRoute: HomeRoute,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
