import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Helper/def_text.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationDrawersHeader extends StatelessWidget {
  const NavigationDrawersHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerSize;
    double avtarMinRadius;
    double avtarMaxRadius;
    double sizeboxight;
    double myFontSize;
    return ResponsiveBuilder(builder: (context, sizeingInformatiom) {
      if (sizeingInformatiom.deviceScreenType == DeviceScreenType.mobile) {
        containerSize = 50;
        avtarMinRadius = 8;
        avtarMaxRadius = 16;
        sizeboxight = 4;
        myFontSize = 12;
      } else if (sizeingInformatiom.deviceScreenType ==
          DeviceScreenType.tablet) {
        containerSize = 110;
        avtarMinRadius = 10;
        avtarMaxRadius = 20;
        sizeboxight = 5;
        myFontSize = 12;
      } else {
        containerSize = 150;
        avtarMinRadius = 20;
        avtarMaxRadius = 40;
        sizeboxight = 10;
        myFontSize = 18;
      }

      return Container(
        height: containerSize,
        color: green.withOpacity(.3),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 4,),
            CircleAvatar(
              backgroundColor: red,
              minRadius: avtarMinRadius,
              maxRadius: avtarMaxRadius,
            ),
            SizedBox(
              height: sizeboxight,
            ),
            MyText(
              text: "manipoint@gmail.com",
              color: white,
              weight: FontWeight.w600,
              size: myFontSize,
            ),
          ],
        ),
      );
    });
  }
}
