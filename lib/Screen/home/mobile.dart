import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Widgets/small_card.dart';

class MobileMode extends StatefulWidget {
  @override
  _MobileModeState createState() => _MobileModeState();
}

class _MobileModeState extends State<MobileMode> {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body:SingleChildScrollView(
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
              ,title: "Revanue",
              value: 100000,),
                 SmallCard(color1: white,
              color2: Colors.green.shade300,
              icon: Icons.attach_money
              ,title: "Revanue",
              value: 100000,),
              
            
           ],),
           
         ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical:20.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
              SmallCard(color1: white,
              color2: Colors.green.shade300,
              icon: Icons.attach_money
              ,title: "Mobile",
              value: 100000,),
                 SmallCard(color1: white,
              color2: Colors.green.shade300,
              icon: Icons.attach_money
              ,title: "Revanue",
              value: 100000,),
              
            
           ],),
           
         ),
         
           
        ],),
      ),
    );
  }
}

// dashBoardScreen(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 4.0, top: 10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             "Revenue",
//             style: TextStyle(
//               color: Colors.grey,
//               fontSize: 38,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             "Rs 1000",
//             style: TextStyle(
//               color: Colors.grey.shade700,
//               fontSize: 38,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SmallCard(
//                 icon: Icons.attach_money_rounded,
//                 title: "Sales",
//                 value: 78,
//                 color1: Colors.green.shade50,
//                 color2: Colors.lightGreen.shade50,
//               ),
//               SmallCard(
//                 icon: Icons.shopping_bag_rounded,
//                 title: "Stock",
//                 value: 10000,
//                 color1: Colors.green.shade50,
//                 color2: Colors.lightGreen.shade50,
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//               child: Text(
//             "Sales Per Category",
//             style: TextStyle(fontSize: 20),
//           )),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
//           child: Container(
//             height: MediaQuery.of(context).size.height / 2.5,
//             width: MediaQuery.of(context).size.width / 1.2,
//             decoration: BoxDecoration(
//                 color: Colors.green.shade50,
//                 borderRadius: BorderRadius.circular(16)),
//             child: PieChartWidget(),
//           ),
//         )
//       ],
//     ),
//   );
// }
