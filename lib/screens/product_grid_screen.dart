import 'package:flutter/material.dart';

class ProductGridScreen extends StatelessWidget {

  final List<Map<String, dynamic>> products = [
    {'name': 'Product 1', 'price': '\$10.00', 'quantity': 20, 'image': 'assets/product1.jpg'},
    {'name': 'Product 2', 'price': '\$15.00', 'quantity': 15, 'image': 'assets/product2.jpg'},
    {'name': 'Product 3', 'price': '\$20.00', 'quantity': 10, 'image': 'assets/product3.jpg'},
    {'name': 'Product 4', 'price': '\$25.00', 'quantity': 5, 'image': 'assets/product4.jpg'},
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Grid'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(4),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 2,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 300,
                  child: Image.asset(
                    product['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text('Price: ${product['price']}', style: TextStyle(fontSize: 15)),
                      SizedBox(height: 2),
                      Text('Quantity: ${product['quantity']}', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
