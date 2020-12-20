import 'package:flutter/material.dart';
import 'package:food_admin_side/Services/navigation_sevice.dart';

import '../../locator.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String route;
  const NavBarItem({Key key, this.title, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        locator<NavigationService>().globelNavigatorTo(route, context);
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
