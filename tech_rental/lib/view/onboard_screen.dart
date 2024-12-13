import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Icon
            Image.asset(
              'assets/images/bbicon.png',
              width: 150, 
              height: 150,
            ),
            const SizedBox(height: 40),

            // Welcome Text
            const Text(
              'Welcome to BorrowBox!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              ),
            ),
            const SizedBox(height: 40),

            // Get Started Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: (Color(0xFFF9B401)), 
                minimumSize: const Size(200, 50),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
