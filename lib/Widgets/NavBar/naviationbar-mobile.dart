import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';


class NavigationBarMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldState;

  const NavigationBarMobile({Key key, this.scaffoldState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu,color: black,),
            onPressed: () {
             // CustomNavigationDrawer();
            },
          ),
          //NavBarLogo()
        ],
      ),
    );
  }
}
