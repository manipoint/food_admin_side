

import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';

class AddRestaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
      )
      ,
      body: Container(decoration: BoxDecoration(color: green),),
    );
  }
}
