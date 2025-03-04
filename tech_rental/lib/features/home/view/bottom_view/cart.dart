import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(156, 19, 34, 87),
      appBar: AppBar(title: const Text('Cart')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          HistoryItem(
              imagePath: 'assets/images/ps5.png',
              name: 'PS5',
              description: 'PS5 with dual controllers',
              status: 'Added to Cart'),
          HistoryItem(
              imagePath: 'assets/images/camera.png',
              name: 'Sony Camera Pro',
              description: 'camera pro',
              status: 'Added to Cart'),
          HistoryItem(
              imagePath: 'assets/images/tv.png',
              name: 'Samsung Tv',
              description: '4k Tv',
              status: 'Added to Cart'),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle checkout action
          },
          child: const Text('Proceed to Checkout'),
        ),
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final String status;

  const HistoryItem(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.description,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(name),
        subtitle: Text(description),
        trailing: Text(status,
            style: TextStyle(
                color:
                    status == 'Added to Cart' ? Colors.green : Colors.orange)),
      ),
    );
  }
}
