

import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Helper/def_text.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: green.withOpacity(.3),
      alignment: Alignment.center,
      child: Column(children: 
      [
        CircleAvatar(backgroundColor: red,),
        SizedBox(height: 10,),
        MyText(text:"manipoint@gamil.com",color: white,weight: FontWeight.w600,size: 23,),
      ],),
    );
  }
}