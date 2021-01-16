import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Helper/def_text.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SmallCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final String value;
  final Color color1;
  final Color color2;

  const SmallCard(
      {Key key,
      this.icon,
      this.title,
      this.subTitle,
      this.value,
      this.color1,
      this.color2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double cardWidth;
    double cardHeight;
    double iconSize;
    double myFontSize;
    return ResponsiveBuilder(
      builder: (context, sizeingInformatiom) {
        if (sizeingInformatiom.deviceScreenType == DeviceScreenType.mobile) {
          cardWidth = MediaQuery.of(context).size.width / 1.25;
          cardHeight = MediaQuery.of(context).size.height / 6;
          iconSize = 25;
          myFontSize = 16;
        } else if (sizeingInformatiom.deviceScreenType ==
            DeviceScreenType.tablet) {
          cardWidth = MediaQuery.of(context).size.width / 3;
          cardHeight = MediaQuery.of(context).size.height / 7.5;
          iconSize = MediaQuery.of(context).size.width / 35;
          myFontSize = MediaQuery.of(context).size.width / 55;
        } else {
          cardWidth = MediaQuery.of(context).size.width / 3;
          cardHeight = MediaQuery.of(context).size.height / 7.5;
          iconSize = MediaQuery.of(context).size.width / 30;
          myFontSize = MediaQuery.of(context).size.width / 60;
        }
        return Container(
          height: cardHeight,
          width: cardWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  colors: [color1 ?? Colors.green, color2 ?? Colors.blue],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(0, 3),
                    blurRadius: 16)
              ]),
          child: Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: iconSize,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  MyText(
                    text: title,
                    size: myFontSize,
                    weight: FontWeight.bold,
                    color: white,
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  MyText(
                    text: subTitle,
                    size: myFontSize,
                    weight: FontWeight.w400,
                    color: white,
                  ),
                ],
              ),
              MyText(
                text: value,
                size: myFontSize + 18,
                weight: FontWeight.bold,
                color: white,
              )
            ],
          )),
        );
      },
    );
  }
}

// old card
//  double cardWidth;
    // double cardHeight;
    // double iconSize;
    // double myFontSize;
//return ResponsiveBuilder(builder: (context, sizeingInformatiom) {
    //   if (sizeingInformatiom.deviceScreenType == DeviceScreenType.mobile) {
    //     cardWidth = MediaQuery.of(context).size.width / 3;
    //     cardHeight = MediaQuery.of(context).size.height / 8;
    //     iconSize = 30;
    //     myFontSize = 20;
    //   } else if (sizeingInformatiom.deviceScreenType ==
    //       DeviceScreenType.tablet) {
    //     cardWidth = MediaQuery.of(context).size.width / 5.7;
    //     cardHeight = MediaQuery.of(context).size.height / 7.5;
    //     iconSize = MediaQuery.of(context).size.width / 40;
    //     myFontSize = MediaQuery.of(context).size.width / 38;
    //   } else {
    //     cardWidth = MediaQuery.of(context).size.width / 5.7;
    //     cardHeight = MediaQuery.of(context).size.height / 5.7;
    //     iconSize = MediaQuery.of(context).size.width / 40;
    //     myFontSize = MediaQuery.of(context).size.width / 40;
    //   }

    //   return FittedBox(
    //     child: Container(
    //       width: cardWidth,
    //       height: cardHeight,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(16),
    //           gradient: LinearGradient(colors: [widget.color1, widget.color2]),
    //           boxShadow: [
    //             BoxShadow(
    //                 color: Colors.grey[400],
    //                 offset: Offset(1.0, 1.0),
    //                 blurRadius: 4)
    //           ]),
    //       child: SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             Row(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 8.0, top: 8),
    //                   child: Icon(
    //                     widget.icon,
    //                     color: Colors.green.shade300,
    //                     size: iconSize,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: 20,
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(top: 8.0),
    //                   child: Text(
    //                     widget.title,
    //                     style: TextStyle(
    //                       color: grey,
    //                       fontSize: myFontSize,
    //                       fontWeight: FontWeight.w300,
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 12.0, left: 2, right: 2),
    //               child: Text(
    //                 widget.value.toString(),
    //                 style: TextStyle(
    //                     fontSize: myFontSize, fontWeight: FontWeight.w700),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // });