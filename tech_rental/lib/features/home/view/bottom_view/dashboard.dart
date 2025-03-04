import 'package:flutter/material.dart';
import 'package:tech_rental/features/home/view/bottom_view/all_gadgets_page.dart';
import 'package:tech_rental/features/home/view/bottom_view/cart.dart';
import 'package:tech_rental/features/home/view/bottom_view/profile_page.dart';

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
    const CartPage(),
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
      backgroundColor: Colors.green, // Set background color to green
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
            icon: const Icon(Icons.car_crash, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
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
                icon: Icons.shopping_cart,
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

class DashboardHomePage extends StatefulWidget {
  const DashboardHomePage({super.key});

  @override
  State<DashboardHomePage> createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  final List<Gadget> gadgets = [
    Gadget(
        category: 'PlayStation',
        name: 'PS5',
        price: 'NPR 4000',
        imagePath: 'assets/images/ps5.png'),
    Gadget(
        category: 'Laptop',
        name: 'MacBook Air M2',
        price: 'NPR 1400',
        imagePath: 'assets/images/laptop.png'),
    Gadget(
        category: 'Camera',
        name: 'Canon EOS R5',
        price: 'NPR 1400',
        imagePath: 'assets/images/camera.png'),
    Gadget(
        category: 'Phone',
        name: 'Iphone 14 Pro',
        price: 'NPR 1800',
        imagePath: 'assets/images/phone.png'),
  ];

  String selectedCategory = 'All';
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Gadget> filteredGadgets = gadgets.where((gadget) {
      return (selectedCategory == 'All' ||
              gadget.category == selectedCategory) &&
          (gadget.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              gadget.category
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()));
    }).toList();

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
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (query) {
                        setState(() {
                          searchQuery = query;
                        });
                      },
                      decoration: const InputDecoration(
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
            // Category filter using CategoryItem
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryItem(
                  icon: Icons.videogame_asset_rounded,
                  label: 'PlayStation',
                  onTap: () {
                    setState(() {
                      selectedCategory = 'PlayStation';
                    });
                  },
                ),
                CategoryItem(
                  icon: Icons.laptop,
                  label: 'Laptop',
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Laptop';
                    });
                  },
                ),
                CategoryItem(
                  icon: Icons.camera_alt,
                  label: 'Camera',
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Camera';
                    });
                  },
                ),
                CategoryItem(
                  icon: Icons.phone_iphone,
                  label: 'Phone',
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Phone';
                    });
                  },
                ),
                CategoryItem(
                  icon: Icons.all_inclusive,
                  label: 'All',
                  onTap: () {
                    setState(() {
                      selectedCategory = 'All';
                    });
                  },
                ),
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
                    'View all gadgets...',
                    style: TextStyle(
                      color: Colors.yellow[700],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Filtered Gadgets
            Column(
              children: filteredGadgets.map((gadget) {
                return HotDealCard(
                  imagePath: gadget.imagePath,
                  category: gadget.category,
                  name: gadget.name,
                  price: gadget.price,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Gadget {
  final String category;
  final String name;
  final String price;
  final String imagePath;

  Gadget({
    required this.category,
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 10,
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Icon(icon, size: 24, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
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
    return GestureDetector(
      onTap: () {
        // Show snack bar when card is tapped
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Added to Cart Successfully'),
            duration: Duration(seconds: 2),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
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
      ),
    );
  }
}

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
      child: AnimatedScale(
        scale: isSelected ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Icon(icon,
            size: 28, color: isSelected ? Colors.yellow[700] : Colors.white),
      ),
    );
  }
}
