import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_admin_side/Helper/constent.dart';
import 'package:food_admin_side/Model/user.dart';
import 'package:food_admin_side/Services/user_services.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  User _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  //gettter

  UserModel get userModel => _userModel;
  Status get status => _status;
  User get user => _user;

  // public variables

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthProvider.initialize() {
    _firebaseSetUp();
  }

  _firebaseSetUp() async {
    await initialization.then((value) {
      auth.authStateChanges().listen(_onStateChanged);
    });
  }

  void _onStateChanged(User firebaseUser) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      await preferences.setString("id", firebaseUser.uid);

      _userModel = await _userServices.getUserById(user.uid).then((value) {
        _status = Status.Authenticated;
        return value;
      });
    }
    notifyListeners();
  }

  String validateEmail(String value) {
    value = value.trim();

    if (email.text != null) {
      if (value.isEmpty) {
        return "Please Enter Email to login ";
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return "Enter Correct Email ";
      }
    }
    return null;
  }
}
