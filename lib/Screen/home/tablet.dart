import 'package:flutter/material.dart';
import 'package:food_admin_side/Widgets/Card/card_list.dart';
import 'package:food_admin_side/Widgets/Charts/bar_chart.dart';
import 'package:food_admin_side/Widgets/Charts/pie_chart.dart';
import 'package:food_admin_side/Widgets/Charts/sales_chart.dart';
import 'package:food_admin_side/Widgets/Charts/transection_chart.dart';

class TabletMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CardList(),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(color: Colors.white),
                child: NewPieChart(),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(color: Colors.white),
                child: BarChartWidget(),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(color: Colors.white),
                child: TransectionChart(),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(color: Colors.white),
                child: SalesChart(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// dashBoardScreen(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 4.0, top: 10),
//     child: Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Revenue",
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 38,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Rs 1000",
//               style: TextStyle(
//                 color: Colors.grey.shade700,
//                 fontSize: 38,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SmallCard(
//                   icon: Icons.attach_money_rounded,
//                   title: "Sales",
//                   value: 78,
//                   color1: Colors.green.shade50,
//                   color2: Colors.lightGreen.shade50,
//                 ),
//                 SmallCard(
//                   icon: Icons.shopping_bag_rounded,
//                   title: "Stock",
//                   value: 10000,
//                   color1: Colors.green.shade50,
//                   color2: Colors.lightGreen.shade50,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//                 child: Text(
//               "Sales Per Category",
//               style: TextStyle(fontSize: 20),
//             )),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
//             child: Container(
//               height: MediaQuery.of(context).size.height / 2.5,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   color: Colors.green.shade50,
//                   borderRadius: BorderRadius.circular(16)),
//               child: PieChartWidget(),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
