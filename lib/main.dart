import 'package:fluter_catalog/pages/home_page.dart';
import 'package:fluter_catalog/pages/login_page.dart';
import 'package:fluter_catalog/utilities/routes.dart';
import 'package:fluter_catalog/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme:MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
