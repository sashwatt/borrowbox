import 'package:flutter/material.dart';

class RecentHistory extends StatelessWidget {
  const RecentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 34, 87, 100),
      appBar: AppBar(title: const Text('Recent History')),
      body: const Center(
        child: Text('Recent History Page',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}
