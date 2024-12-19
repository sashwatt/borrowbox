import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 34, 87, 100),
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(
        child: Text('Settings Page',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}
