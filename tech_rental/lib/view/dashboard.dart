import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the BorrowBox Dashboard!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
