import 'package:flutter/material.dart';

class AllGadgetsPage extends StatelessWidget {
  const AllGadgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 34, 87, 100),
      appBar: AppBar(title: const Text('All Gadgets')),
      body: const Center(
        child: Text('All Gadgets page',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}
