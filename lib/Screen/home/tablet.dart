import 'package:flutter/material.dart';
import 'package:food_admin_side/Screen/add_category.dart';
import 'package:food_admin_side/Screen/add_product.dart';
import 'package:food_admin_side/Screen/add_resturent.dart';
import 'package:food_admin_side/Widgets/NavBar/navigation_bar.dart';
import 'package:food_admin_side/Widgets/pie_chart.dart';
import 'package:food_admin_side/Widgets/small_card.dart';

class TabletMode extends StatefulWidget {
  @override
  _TabletModeState createState() => _TabletModeState();
}

class _TabletModeState extends State<TabletMode> {
  int _selectedIndex = 0;
  // List screen = [dashBoardScreen(context),AddProduct(),AddRestaurant(),AddCategory()];
  @override
  Widget build(BuildContext context) {
    List screen = [
      dashBoardScreen(context),
      AddProduct(),
      AddRestaurant(),
      AddCategories()
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          Text("Tablet")
          ],
        ),
      ),
    );
  }
}

dashBoardScreen(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 4.0, top: 10),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Revenue",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 38,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Rs 1000",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 38,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallCard(
                  icon: Icons.attach_money_rounded,
                  title: "Sales",
                  value: 78,
                  color1: Colors.green.shade50,
                  color2: Colors.lightGreen.shade50,
                ),
                SmallCard(
                  icon: Icons.shopping_bag_rounded,
                  title: "Stock",
                  value: 10000,
                  color1: Colors.green.shade50,
                  color2: Colors.lightGreen.shade50,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              "Sales Per Category",
              style: TextStyle(fontSize: 20),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(16)),
              child: PieChartWidget(),
            ),
          )
        ],
      ),
    ),
  );
}
