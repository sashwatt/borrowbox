import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tech_rental/features/auth/data/data_source/auth_remote_datasource/auth_remote_datasource.dart';
import 'package:tech_rental/features/auth/domain/entity/product_entity.dart';

import '../../features/auth/data/data_source/auth_remote_datasource/auth_remote_datasource.dart'
    as authDataSource;

class AllGadgetsPage extends StatefulWidget {
  const AllGadgetsPage({super.key});

  @override
  State<AllGadgetsPage> createState() => _AllGadgetsPageState();
}

class _AllGadgetsPageState extends State<AllGadgetsPage> {
  late Future<List<dynamic>> _gadgetsFuture;
  final AuthRemoteDataSource authDataSource = AuthRemoteDataSource(Dio());

  @override
  void initState() {
    super.initState();
    _gadgetsFuture = authDataSource.getProducts();
    ();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(156, 19, 34, 87),
      appBar: AppBar(
        title: const Text("All Gadgets", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                    "Failed to load gadgets cc",
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
          print(snapshot.data);
          List<dynamic> gadgets = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: gadgets.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    gadgets[index]['imageUrl'] = gadgets[index]['imageUrl']!
                        .replaceAll('localhost', '10.0.2.2');
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
    );
  }

  void _showGadgetDetails(BuildContext context, dynamic gadget) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(gadget['name']!),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(gadget['imageUrl']!, height: 150),
              const SizedBox(height: 10),
              Text(gadget['price'].toString(),
                  style: const TextStyle(fontSize: 18)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            )
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              imagePath.replaceAll('localhost', '10.0.2.2'),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 50, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text(price,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
