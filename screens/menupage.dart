import 'package:coffee_shop/screens/cart_page.dart';
import 'package:coffee_shop/views/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coffee_shop/screens/login_page.dart';
import 'package:coffee_shop/screens/product_details_page.dart';
import 'package:coffee_shop/screens/profile_page.dart';
import 'package:coffee_shop/screens/settings.dart';

class MenuPage extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController()); // GetX controller

  final List<Map<String, dynamic>> _coffeeBrands = [
    {'imagePath': 'assets/images/Capuccino.png', 'name': 'Cappuccino', 'price': 4.99},
    {'imagePath': 'assets/images/Espresso.png', 'name': 'Espresso', 'price': 3.99},
    {'imagePath': 'assets/images/latte.png', 'name': 'Latte', 'price': 5.99},
    {'imagePath': 'assets/images/americano.png', 'name': 'Americano', 'price': 5.99},
  ];

  final List<Map<String, dynamic>> _nonCoffeeBeverages = [
    {'imagePath': 'assets/images/tea.png', 'name': 'Tea', 'price': 2.49},
    {'imagePath': 'assets/images/hotchocolate.png', 'name': 'Hot Chocolate', 'price': 3.99},
    {'imagePath': 'assets/images/smoothie.png', 'name': 'Smoothie', 'price': 5.99},
  ];

  final List<Map<String, dynamic>> _foodOptions = [
    {'imagePath': 'assets/images/pastries.png', 'name': 'Pastries', 'price': 3.49},
    {'imagePath': 'assets/images/sandwhich.png', 'name': 'Sandwich', 'price': 4.99},
    {'imagePath': 'assets/images/snack.png', 'name': 'Snack', 'price': 2.99},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.settings),
              //   label: 'Settings',
              // ),
            ],
            currentIndex: _controller.selectedPage.value,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            onTap: (index) => _controller.setSelectedPage(index),
          )),
      body: Obx(() {
        switch (_controller.selectedPage.value) {
          case 0:
            return Scaffold(
              appBar: AppBar(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search menu',
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    // Your search logic here
                  },
                ),
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
                      leading: Icon(Icons.person, color: Colors.orange),
                      title: Text('Profile'),
                      onTap: () {
                         Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UserProfilePage()),
                              );
                      },
                    ),
                     ListTile(
                      leading: Icon(Icons.history, color: Colors.orange),
                      title: Text('Orders'),
                      onTap: () {
                         Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UserProfilePage()),
                              );
                      },
                    ),
                      ListTile(
                      leading: Icon(Icons.share_sharp, color: Colors.orange),
                      title: Text('Share'),
                      onTap: () {
                          // Navigator.push(
                          //       context,
                          //       MaterialPageRoute(builder: (context) => MenuPage()),
                          //     );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings, color: Colors.orange),
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
                      leading: Icon(Icons.logout, color: Colors.orange),
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
              body: _buildMenuBody(),
            );
          case 1:
            return CartPage();
          // case 2:
          //   return SettingsPage();
          default:
            return Container(); // Placeholder, you can handle other cases as needed
        }
      }),
    );
  }

  Widget _buildMenuBody() {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              // Search logic
            },
            child: Text('Search'),
          ),
        ),
        SizedBox(height: 20),
        _buildProductList('Coffee Brands', _coffeeBrands),
        SizedBox(height: 20),
        _buildProductList('Non-Coffee Beverages', _nonCoffeeBeverages),
        SizedBox(height: 20),
        _buildProductList('Food Options', _foodOptions),
      ],
    );
  }

  Widget _buildProductList(String title, List<Map<String, dynamic>> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFA000),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return InkWell(
                onTap: () {
                  // Navigate to Product Details
                  Get.to(ProductDetailsPage(
                    name: product['name'],
                    price: product['price'],
                  ));
                },
                child: _buildMenuItem(
                  product['imagePath'],
                  product['name'],
                  product['price'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String imagePath, String name, double price) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '\$$price',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}