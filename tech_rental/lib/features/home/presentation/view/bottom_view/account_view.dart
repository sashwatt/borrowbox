import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 34, 87, 100),
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(
        child: Text('Profile Page',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}
