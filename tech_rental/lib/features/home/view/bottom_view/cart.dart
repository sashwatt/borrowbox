import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(156, 19, 34, 87), // Background color
      appBar: AppBar(
        title: const Text('Your Cart'),
        elevation: 10,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          HistoryItem(
            imagePath: 'assets/images/ps5.png',
            name: 'PS5',
            description: 'PS5 with dual controllers',
            status: 'Added to Cart',
          ),
          HistoryItem(
            imagePath: 'assets/images/camera.png',
            name: 'Sony Camera Pro',
            description: 'camera pro',
            status: 'Added to Cart',
          ),
          HistoryItem(
            imagePath: 'assets/images/tv.png',
            name: 'Samsung Tv',
            description: '4k TV',
            status: 'Added to Cart',
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle checkout action
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green, // Text color
            padding:
                const EdgeInsets.symmetric(vertical: 16.0), // Button padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded button corners
            ),
            elevation: 5, // Add shadow to the button
          ),
          child: const Text(
            'Proceed to Checkout',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
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

  const HistoryItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8, // Add shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners for the card
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        trailing: Text(
          status,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: status == 'Added to Cart' ? Colors.green : Colors.orange,
          ),
        ),
      ),
    );
  }
}
