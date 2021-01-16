import 'package:flutter/material.dart';
import 'package:food_admin_side/Routes/custum_routs.dart';
import 'package:food_admin_side/Routes/routs_name.dart';
import 'package:food_admin_side/Services/navigation_sevice.dart';
import 'package:food_admin_side/Widgets/Drawer/side_menu.dart';
import 'package:food_admin_side/locator.dart';

class LayoutWidget extends StatelessWidget {
  //GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
     GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      // drawer: Container(
      //   width: 200,
      //   color: Colors.white,
      //   child: ListView(
      //     children: [
      //       ListTile(
      //         title: Text("Lessons"),
      //         leading: Icon(Icons.book),
      //       )
      //     ],
      //   ),
      // ),
      body: Row(
        children: [
           SideMenu(),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Navigator(
                    key: locator<NavigationService>().navigatorKey,
                    onGenerateRoute: generateRoute,
                    initialRoute: HomeRoute,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


//ResponsiveBuilder(
    //   builder: (context, sizeingInforamtion) => Scaffold(
    //       drawer: sizeingInforamtion.deviceScreenType == DeviceScreenType.mobile
    //           ? CustomNavigationDrawer()
    //           : null,
    //       backgroundColor: green.withOpacity(.2),
          
    //       body: Center(
    //         child: Column(
    //           children: [
             
    //             NavigationBarCustom(),
    //             Expanded(
    //               child: Navigator(
    //                 key: locator<NavigationService>().navigatorKey,
    //                 onGenerateRoute: generateRoute,
    //                 initialRoute: HomeRoute,
                    
    //               ),
    //             ),
               
    //           ],
    //         ),
    //       )),
    // );
