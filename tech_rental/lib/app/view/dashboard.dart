import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  // List of pages to display for each bottom navigation item
  final List<Widget> _pages = [
    const DashboardHomePage(),
    const AllGadgetsPage(),
    const RecentHistoryPage(),
    const ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(156, 19, 34, 87),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
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
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(12, 21, 54, 0.612),
          border: Border(
            top: BorderSide(color: Colors.grey.shade800, width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavItem(
                icon: Icons.grid_view,
                isSelected: _currentIndex == 0,
                onTap: () => _onTabTapped(0),
              ),
              BottomNavItem(
                icon: Icons.laptop_mac,
                isSelected: _currentIndex == 1,
                onTap: () => _onTabTapped(1),
              ),
              BottomNavItem(
                icon: Icons.access_time,
                isSelected: _currentIndex == 2,
                onTap: () => _onTabTapped(2),
              ),
              BottomNavItem(
                icon: Icons.person,
                isSelected: _currentIndex == 3,
                onTap: () => _onTabTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Pages for Each Bottom Navigation Item //

class DashboardHomePage extends StatelessWidget {
  const DashboardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    icon: const Icon(Icons.filter_alt, color: Colors.black87),
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
                CategoryItem(
                    icon: Icons.videogame_asset_rounded, label: 'PlayStation'),
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
    );
  }
}

class RecentHistoryPage extends StatelessWidget {
  const RecentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Recent History Page',
          style: TextStyle(color: Colors.white, fontSize: 24)),
    );
  }
}

class AllGadgetsPage extends StatelessWidget {
  const AllGadgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('All Gadgets Page',
          style: TextStyle(color: Colors.white, fontSize: 24)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page',
          style: TextStyle(color: Colors.white, fontSize: 24)),
    );
  }
}

// Category and Hot Deal Card Widgets//

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({super.key, required this.icon, required this.label});

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
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
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
    super.key,
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
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category,
                  style: const TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 4),
              Text(name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(price,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

// Bottom Navigation Item Widget //

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon,
          size: 28, color: isSelected ? Colors.yellow[700] : Colors.white),
    );
  }
}
