

import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Helper/def_text.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: green.withOpacity(.3),
      alignment: Alignment.center,
      child: Column(children: 
      [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(backgroundColor: red,minRadius: 20,maxRadius: 40,),
        ),
        SizedBox(height: 10,),
        MyText(text:"manipoint@gamil.com",color: white,weight: FontWeight.w600,size: 18,),
      ],),
    );
  }
}