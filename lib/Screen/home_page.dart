

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_admin_side/Components/def_colors.dart';
import 'package:food_admin_side/Providers/app_provider.dart';
import 'package:food_admin_side/Screen/add_product.dart';
import 'package:food_admin_side/Widgets/pie_chart.dart';
import 'package:food_admin_side/Widgets/small_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
   List screen = [dashBoardScreen(),AddProduct(),];
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context);
    return Scaffold(
        body: SafeArea(
      child: Row(
        children: [
          NavigationRail(
            minWidth: 74,
            backgroundColor: Colors.grey.shade200,
            leading: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 22,
                  ),
                ),
              ],
            ),
            destinations: [
              NavigationRailDestination(
                  icon: Icon(

                    Icons.dashboard,
                    size: 30,
                    color: Colors.blue,
                  ),
                  label: Text(""),
                ),
              NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Add Product"),
                  ),
                  ),
              NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Orders"),
                  )),
              NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Sighup"),
                  ))
            ],
            labelType: NavigationRailLabelType.all,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },

            unselectedLabelTextStyle:
                TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            selectedLabelTextStyle: TextStyle(
              // decorationThickness: 10.0,
              height: 3.0,
              wordSpacing: 4.0,
              color: Colors.red,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold,
              //decoration: TextDecoration.underline,
            ),

          ),
         Expanded(child: screen[_selectedIndex]),

        ],
      ),
    ));
    // ignore: dead_code
  }


}
dashBoardScreen() {
  return Padding(
    padding: const EdgeInsets.only(left: 4.0, top: 10),
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
            // height: MediaQuery.of(context).size.height / 2,
            // width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(16)),
            child: PieChartWidget(),
          ),
        )
      ],
    ),
  );
}
