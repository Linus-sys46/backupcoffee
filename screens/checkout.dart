import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CheckoutPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  double _calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in widget.cartItems) {
      totalPrice += item['price'] * item['quantity'];
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return ListTile(
                  leading: Image.asset(
                    item['imagePath'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item['name']),
                  subtitle: Text('Price: \$${item['price'].toStringAsFixed(2)}'),
                  trailing: Text('x${item['quantity']}'),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${_calculateTotalPrice().toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _placeOrder,
              child: Text('Place Order'),
            ),
          ),
        ],
      ),
    );
  }

  void _placeOrder() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Order Placed'),
          content: Text('Thank you for your order!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}