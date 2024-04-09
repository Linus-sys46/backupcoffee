import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String name;
  final double price;

  const ProductDetailsPage({Key? key, required this.name, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Product: $name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Price: \$${price.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle add to cart or make payment functionality
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}