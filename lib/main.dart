import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/constent.dart';
import 'package:food_admin_side/Providers/app_provider.dart';
import 'package:food_admin_side/Providers/auth_provider.dart';
import 'package:food_admin_side/Providers/tabels.dart';
import 'package:food_admin_side/Routes/custum_routs.dart';
import 'package:food_admin_side/Routes/routs_name.dart';
import 'package:food_admin_side/Screen/login/login.dart';
import 'package:food_admin_side/Widgets/Layout/layout.dart';
import 'package:food_admin_side/Widgets/loading.dart';
import 'package:provider/provider.dart';

import 'Providers/tabels.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: AppProvider.init(),
    ),
    ChangeNotifierProvider.value(
      value: AuthProvider.initialize(),
    ),
    ChangeNotifierProvider.value(
      value: TablesProvider.init(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      onGenerateRoute: generateRoute,
      initialRoute: PageControllerRoute,
    );
  }
}

class AppPagesController extends StatelessWidget {
  // const AppPagesController({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        //checking errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("SomeThing went Wrong")],
            ),
          );
        }
        //show application
        if (snapshot.connectionState == ConnectionState.done) {
          print(authProvider.status.toString());
          switch (authProvider.status) {
            case Status.Uninitialized:
              return Loading();
            case Status.Unauthenticated:
            case Status.Authenticating:
              return LoginPage();
            case Status.Authenticated:
              return LayoutWidget();
          }
        }
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
