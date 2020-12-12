import 'package:flutter/cupertino.dart';

enum DisplayedPage { HOME, PRODUCT, RESTURENT, CATEGORIES, USERS, ORDERS }

class AppProvider with ChangeNotifier {
  DisplayedPage currentPage;

  AppProvider.init() {
    changeCurrentPage(DisplayedPage.HOME);
  }

  void changeCurrentPage(DisplayedPage page) {
    currentPage = page;
    notifyListeners();
  }
}
