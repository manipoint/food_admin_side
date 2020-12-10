
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_admin_side/Components/def_colors.dart';

class SmallCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final int value;
  final Color color1;
  final Color color2;

  const SmallCard({Key key, this.icon, this.title, this.value, this.color1, this.color2}) : super(key: key);

  @override
  _SmallCardState createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width/2.8,
          height:MediaQuery.of(context).size.height/6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient:
              LinearGradient(colors: [widget.color1, widget.color2]),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    offset: Offset(1.0, 1.0),
                    blurRadius: 4)
              ]),
           child: Column(
             children: [
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0,top: 8),
                     child: Icon(
                       widget.icon,
                       color: Colors.green.shade300,
                       size: 28,
                     ),
                   ),
                   SizedBox(
                     width: 12,
                   ),
                   Padding(
                     padding: const EdgeInsets.only(top:8.0),
                     child: Text(widget.title,style: TextStyle(
                       color: grey,
                       fontSize: 20,
                       fontWeight: FontWeight.w300,
                     ),),
                   )
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.only(top:12.0,left: 2,right: 2),
                 child: Text(widget.value.toString(),
                 style: TextStyle(
                   fontSize: 40,
                   fontWeight: FontWeight.w700
                 ),),
               )
             ],
           ),
          
        )
      ],
    );
  }
}
