import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Widgets/Card/card_list.dart';
import 'package:food_admin_side/Widgets/Charts/bar_chart.dart';
import 'package:food_admin_side/Widgets/Charts/pie_chart.dart';
import 'package:food_admin_side/Widgets/Charts/sales_chart.dart';
import 'package:food_admin_side/Widgets/Charts/transection_chart.dart';

class DeskTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 30,
        ),
        CardList(),
        SizedBox(
          height: 30,
        ),
        FittedBox(
          child: Card(
            color: white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(color: Colors.white),
                  child: NewPieChart(),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 4.2,
                  decoration: BoxDecoration(color: Colors.white),
                  child: BarChartWidget(),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 4.2,
                  decoration: BoxDecoration(color: Colors.white),
                  child: TransectionChart(),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 4.2,
                  decoration: BoxDecoration(color: Colors.white),
                  child: SalesChart(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
