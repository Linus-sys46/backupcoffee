import 'package:coffee_shop/screens/cart_page.dart';
import 'package:coffee_shop/screens/dashboard_app.dart';
import 'package:coffee_shop/screens/login_page.dart';
import 'package:coffee_shop/screens/menupage.dart';
import 'package:coffee_shop/screens/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      // ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage()
    );
  }
}
