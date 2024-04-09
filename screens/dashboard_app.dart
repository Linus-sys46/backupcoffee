import 'package:coffee_shop/screens/cart_page.dart';
import 'package:coffee_shop/screens/checkout.dart';
import 'package:coffee_shop/screens/login_page.dart';
import 'package:coffee_shop/screens/menupage.dart';
import 'package:coffee_shop/screens/product_details_page.dart';
import 'package:coffee_shop/screens/profile_page.dart';
import 'package:coffee_shop/screens/settings.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, Linus!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFFFA000).withOpacity(0.7),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Linus Korir',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.menu, color:Colors.orange),
              title: Text('Menu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart,color:Colors.orange),
              title: Text('Cart'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => CartPage()),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.person,color:Colors.orange),
              title: Text('User Profile'),
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()),
                );
              },
            ),
              ListTile(
              leading: Icon(Icons.settings,color:Colors.orange),
              title: Text('Settings'),
              onTap: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout,color:Colors.orange),
              title: Text('Logout'),
              onTap: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: MenuPage(),
    );
  }
}