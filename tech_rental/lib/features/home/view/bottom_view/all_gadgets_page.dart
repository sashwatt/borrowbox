import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tech_rental/features/auth/data/data_source/auth_remote_datasource/auth_remote_datasource.dart';

class AllGadgetsPage extends StatefulWidget {
  const AllGadgetsPage({super.key});

  @override
  State<AllGadgetsPage> createState() => _AllGadgetsPageState();
}

class _AllGadgetsPageState extends State<AllGadgetsPage> {
  late Future<List<dynamic>> _gadgetsFuture;
  final AuthRemoteDataSource authDataSource = AuthRemoteDataSource(Dio());
  late Timer _inactivityTimer;

  @override
  void initState() {
    super.initState();
    _gadgetsFuture = authDataSource.getProducts();
    _startInactivityTimer(); // Start the inactivity timer
  }

  void _startInactivityTimer() {
    _inactivityTimer = Timer.periodic(const Duration(seconds: 60), (timer) {
      _showInactivityPopup();
    });
  }

  void _resetInactivityTimer() {
    _inactivityTimer.cancel();
    _startInactivityTimer(); // Restart the timer on user interaction
  }

  void _showInactivityPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Inactivity Alert'),
          content: const Text('You have been inactive for 1 minute!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetInactivityTimer();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Detect user interactions to reset inactivity timer
    return GestureDetector(
      onTap: _resetInactivityTimer, // Reset timer on screen tap
      onPanUpdate: (_) =>
          _resetInactivityTimer(), // Reset timer on swipe gestures
      child: Scaffold(
        backgroundColor: const Color.fromARGB(156, 19, 34, 87),
        appBar: AppBar(
          title:
              const Text("All Gadgets", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              icon: const Icon(Icons.devices, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: FutureBuilder<List<dynamic>>(
          future: _gadgetsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 50),
                    SizedBox(height: 10),
                    Text(
                      "Failed to load gadgets",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Please try again later.",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text("No gadgets available",
                    style: TextStyle(color: Colors.white)),
              );
            }
            List<dynamic> gadgets = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 600 ? 3 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio:
                      MediaQuery.of(context).size.width > 600 ? 0.7 : 0.8,
                ),
                itemCount: gadgets.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      gadgets[index]['imageUrl'] = gadgets[index]['imageUrl']!
                          .replaceAll('localhost', '192.168.18.4');
                      _showGadgetDetails(context, gadgets[index]);
                    },
                    child: GadgetCard(
                      imagePath: gadgets[index]['imageUrl']!,
                      name: gadgets[index]['name']!,
                      price: gadgets[index]['price'].toString(),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _inactivityTimer.cancel(); // Cancel the timer when widget is disposed
    super.dispose();
  }

  void _showGadgetDetails(BuildContext context, dynamic gadget) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(gadget['name']!), // Gadget name as the dialog title
          content: Column(
            mainAxisSize:
                MainAxisSize.min, // Ensures the dialog adapts to content size
            children: [
              Image.network(gadget['imageUrl']!, height: 150), // Gadget image
              const SizedBox(height: 10),
              Text(gadget['price'].toString(),
                  style: const TextStyle(fontSize: 18)), // Gadget price
              Text(
                gadget['description'].toString(),
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                gadget['status'].toString(),
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close button
              child: const Text("Close"),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the "Add to Cart" action here
                // For now, just show a message as an example
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('${gadget['name']} added to cart!'),
                  ),
                );
                Navigator.pop(context); // Close the dialog after adding to cart
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

class GadgetCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  const GadgetCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8, // Shadow to make the card pop
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imagePath.replaceAll('localhost', '192.168.18.4'),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(price,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
