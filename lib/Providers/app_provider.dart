import 'package:flutter/cupertino.dart';
import 'package:food_admin_side/Helper/enmeraors.dart';
import 'package:food_admin_side/Model/orders_model.dart';
import 'package:food_admin_side/Services/order_services.dart';

class AppProvider with ChangeNotifier {
  DisplayPage currentPage;
  // OrderModel _orderModel;
  OrderServices _orderServices = OrderServices();
  double revenue = 0;

  AppProvider.init() {
    changeCurrentPage(DisplayPage.HOME);
  }

  void changeCurrentPage(DisplayPage page) {
    currentPage = page;
    notifyListeners();
  }

  void _getRevenue() async {
    await _orderServices.getAllOrders().then((orders) {
      for (OrderModel order in orders) {
        revenue = revenue + order.total;
        print("-----------TOTAL REVANUE:${revenue.toString()}");
      }
      notifyListeners();
    });
  }
}
