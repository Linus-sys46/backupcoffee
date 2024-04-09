import 'package:flutter/material.dart';
import 'package:coffee_shop/screens/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // You can change the background color as needed
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Espresso.png', // Assuming the image is stored in the assets folder
            fit: BoxFit.cover, // Cover the entire space
            width: MediaQuery.of(context).size.width, // Set the width to match the screen width
            height: MediaQuery.of(context).size.height, // Set the height to match the screen height
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Brewvana',
                  style: GoogleFonts.pacifico(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  // style: TextStyle(
                  //   fontSize: 40,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.white, // Text color
                  // ),
                ),
                SizedBox(height: 50),
                Column(
                  children: [
                    Text(
                      'Welcome to Our Coffee Shop',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Discover the Finest Coffee Blends!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Text color
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Let's Go!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Button color
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WelcomePage(),
  ));
}
