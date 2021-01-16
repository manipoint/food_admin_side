import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Providers/app_provider.dart';
import 'package:food_admin_side/Providers/tabels.dart';
import 'package:food_admin_side/Widgets/Card/small_card.dart';
import 'package:provider/provider.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    TablesProvider tableProvider = Provider.of<TablesProvider>(context);
    return Container(
      height: 120,
      child: Container(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SmallCard(
            icon:Icons.monetization_on_outlined,
            title: "Revenue",
            subTitle: "Revenue this month",
            value: "12000",//Rs ${appProvider.revenue}
            color1: green.withOpacity(.7),
            color2: green,),
            SmallCard(
              icon: Icons.delivery_dining,
              title: "Orders",
              subTitle: "Total orders",
              value: "345",//${tableProvider.orders.length}"
              color1: Colors.lightBlueAccent,
              color2: Colors.blue,
            )
        ],
      ),),
    );
  }
}
