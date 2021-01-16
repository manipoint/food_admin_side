import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Helper/def_text.dart';
import 'package:food_admin_side/Helper/enmeraors.dart';
import 'package:food_admin_side/Providers/app_provider.dart';
import 'package:food_admin_side/Services/navigation_sevice.dart';
import 'package:food_admin_side/locator.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DrawerItems extends StatelessWidget {
  final bool active;
  final String title;
  final IconData icon;
  final DisplayPage page;
  final String route;

  const DrawerItems(
      {Key key, this.active, this.title, this.icon, this.route, this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double myFontSize;
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    return ResponsiveBuilder(builder: (context, sizeingInformatiom) {
      if (sizeingInformatiom.deviceScreenType == DeviceScreenType.mobile) {
        myFontSize = active ? 16 : 12;
      } else if (sizeingInformatiom.deviceScreenType ==
          DeviceScreenType.tablet) {
        myFontSize = active ? 18 : 14;
      } else {
        myFontSize = active ? 23 : 18;
      }

      return ListTile(
        onTap: () {
          appProvider.changeCurrentPage(page);
          locator<NavigationService>().navigateTo(route);
        },
        tileColor: active ? green.withOpacity(.3) : null,
        leading: Icon(
          icon,
          color: white,
        ),
        title: MyText(
          text: title,
          color: white,
          size: myFontSize,
        ),
      );
    });
  }
}
