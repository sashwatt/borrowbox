import 'package:flutter/material.dart';
import 'package:tech_rental/app/view/all_gadgets_page.dart';
import 'package:tech_rental/app/view/dashboard.dart';
import 'package:tech_rental/app/view/profile_page.dart';
import 'package:tech_rental/app/view/recent_history.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

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
      body: _pages[_currentIndex],
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
