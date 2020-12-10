

import 'package:flutter/cupertino.dart';
enum Screen{DASH,PRODUCT,FEATURE,CATEGORIES,SIGNUP,ORDERS}
class AppProvider with ChangeNotifier{
  Screen selectedScreen = Screen.DASH;

  changeScreen(Screen screen){
    selectedScreen = screen;
    notifyListeners();
  }
}