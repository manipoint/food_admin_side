import 'package:flutter/material.dart';
import 'package:food_admin_side/Services/navigation_sevice.dart';

import '../../locator.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String route;
  const NavBarItem({ this.title, this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo(route);
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
