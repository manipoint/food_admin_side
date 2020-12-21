import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_text.dart';
import 'package:food_admin_side/Services/navigation_sevice.dart';
import 'package:food_admin_side/locator.dart';

class DrawerItems extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  const DrawerItems({
    Key key,
    this.title,
    this.icon,
    this.route
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 60),
      child: InkWell(
        child:Row(children: [Icon(icon),SizedBox(
        width: 30,
      ),
      MyText(text: title,)],),
         
        onTap: (){
        locator<NavigationService>().navigateTo(route);
      },),
    );
  }
}
