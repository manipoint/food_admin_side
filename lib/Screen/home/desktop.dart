import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Widgets/small_card.dart';

class DeskTop extends StatefulWidget {
  @override
  _DeskTopState createState() => _DeskTopState();
}

class _DeskTopState extends State<DeskTop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         Padding(
           padding: const EdgeInsets.symmetric(vertical:20.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
              SmallCard(color1: white,
              color2: Colors.green.shade300,
              icon: Icons.attach_money
              ,title: "Desktop",
              value: 100000,),
                 SmallCard(color1: white,
              color2: Colors.green.shade300,
              icon: Icons.attach_money
              ,title: "Revanue",
              value: 100000,),
              
              SmallCard(color1: white,
              color2: Colors.green.shade300,
              icon: Icons.attach_money
              ,title: "Revanue",
              value: 100000,),
                 SmallCard(color1: white,
              color2: Colors.green.shade300,
              icon: Icons.attach_money
              ,title: "Revanue",
              value: 100000,)
            
           ],),
         )
           
        ],),
      ),
      
    );
  }
}