import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Borrow Box',
          style: TextStyle(color: Colors.yellow[700], fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_alt, color: Colors.yellow[700]),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // Gadgets Section
              const Text(
                'Gadgets',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryItem(icon: Icons.videogame_asset_rounded, label: 'PlayStation'),
                  CategoryItem(icon: Icons.laptop, label: 'Laptop'),
                  CategoryItem(icon: Icons.camera_alt, label: 'Camera'),
                  CategoryItem(icon: Icons.phone_iphone, label: 'Phone'),
                ],
              ),
              const SizedBox(height: 20),
              // Hot Deals Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hot deals',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle view all click
                    },
                    child: Text(
                      'View all...',
                      style: TextStyle(
                        color: Colors.yellow[700],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Hot Deals Cards
              const Column(
                children: [
                  HotDealCard(
                    imagePath: 'assets/images/ps5.png',
                    category: 'PlayStation',
                    name: 'PS5',
                    price: 'NPR 1400',
                  ),
                  SizedBox(height: 10),
                  HotDealCard(
                    imagePath: 'assets/images/laptop.png',
                    category: 'Laptop',
                    name: 'MacBook Air M2',
                    price: 'NPR 1400',
                  ),
                  SizedBox(height: 10),
                  HotDealCard(
                    imagePath: 'assets/images/camera.png',
                    category: 'Camera',
                    name: 'Canon EOS R5',
                    price: 'NPR 1400',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
            top: BorderSide(color: Colors.grey.shade800, width: 1), // Optional border
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavItem(
                icon: Icons.grid_view,
                isSelected: true,
              ),
              BottomNavItem(
                icon: Icons.access_time,
                isSelected: false,
              ),
              BottomNavItem(
                icon: Icons.settings,
                isSelected: false,
              ),
              BottomNavItem(
                icon: Icons.person,
                isSelected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: Icon(icon, size: 24, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}

class HotDealCard extends StatelessWidget {
  final String imagePath;
  final String category;
  final String name;
  final String price;

  const HotDealCard({
    required this.imagePath,
    required this.category,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const BottomNavItem({
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 28,
      color: isSelected ? Colors.yellow[700] : Colors.white,
    );
  }
}
