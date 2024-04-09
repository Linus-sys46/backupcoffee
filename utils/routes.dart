import 'package:coffee_shop/screens/login_page.dart';
import 'package:coffee_shop/screens/menupage.dart';
import 'package:coffee_shop/screens/profile_page.dart';
import 'package:coffee_shop/screens/promotions_screen.dart';
import 'package:coffee_shop/screens/registration_page.dart';
import 'package:coffee_shop/screens/settings.dart';
import 'package:coffee_shop/screens/welcome_page.dart';
import 'package:get/get.dart';

class Routes{
  static var routes = [
    GetPage(name: "/", page: (() => WelcomePage())),
    GetPage(name: "/loginpage", page: (() => LoginPage())),
    GetPage(name: "/registration", page: (() => RegistrationPage())),
    GetPage(name: "/menupage", page: (() => MenuPage())),
    GetPage(name: "/profilepage", page: (() => UserProfilePage())),
    GetPage(name: "/settings", page: (() => SettingsPage())),
    GetPage(name: "/promotionscreen", page: (() => PromotionsScreen())),
  ];
}