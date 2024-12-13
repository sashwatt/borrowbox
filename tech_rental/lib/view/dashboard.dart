import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/bbicon.png', 
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20), 
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the BorrowBox Dashboard!',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
