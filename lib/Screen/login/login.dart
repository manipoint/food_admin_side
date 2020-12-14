import 'package:flutter/material.dart';
import 'package:food_admin_side/Helper/def_colors.dart';
import 'package:food_admin_side/Helper/def_text.dart';
import 'package:food_admin_side/Providers/auth_provider.dart';
import 'package:food_admin_side/Routes/routs_name.dart';
import 'package:food_admin_side/Services/navigation_sevice.dart';
import 'package:food_admin_side/Widgets/loading.dart';
import 'package:food_admin_side/locator.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.blue, Colors.indigo.shade600])),
      child: authProvider.status == Status.Authenticating
          ? Loading()
          : Scaffold(
              key: _key,
              backgroundColor: white,
              body: Center(
                child: Container(
                  // color: red,
                  child: Container(
                    height: 400,
                    width: 350,
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.green,
                              offset: Offset(0, 3),
                              blurRadius: 8)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: "Login",
                          size: 22,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextField(
                                controller: authProvider.email,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email',
                                    icon: Icon(Icons.email_outlined)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextField(
                                controller: authProvider.password,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    icon: Icon(Icons.lock_open)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MyText(
                                text: "Forgot password?",
                                size: 18,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(10)),
                            child: FlatButton(
                              onPressed: () async {
                                if (!await authProvider.logIn()) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Login Failed"),
                                  ));
                                  return;
                                }
                                authProvider.clearController();
                                locator<NavigationService>()
                                    .globelNavigatorTo(HomeRoute, context);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyText(
                                      weight: FontWeight.bold,
                                      text: "LOGIN",
                                      size: 20,
                                      color: white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              text: "Do Not Have An Account ? ",
                              size: 18,
                            ),
                            GestureDetector(
                              onTap: () {
                                locator<NavigationService>()
                                    .globelNavigatorTo(SignupRoute, context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left:4.0),
                                child: MyText(
                                  text: "Signup",
                                  color: Colors.indigo,
                                  size: 20,
                                  weight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
