import 'package:flutter/material.dart';

class RecentHistoryPage extends StatelessWidget {
  const RecentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(156, 19, 34, 87),
      appBar: AppBar(title: const Text('Recent History')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          HistoryItem(
              imagePath: 'assets/images/ps5.png',
              name: 'PS5',
              date: 'Feb 24, 2024',
              status: 'Returned'),
          HistoryItem(
              imagePath: 'assets/images/laptop.png',
              name: 'MacBook Air M2',
              date: 'Feb 20, 2024',
              status: 'Pending'),
          HistoryItem(
              imagePath: 'assets/images/camera.png',
              name: 'Canon EOS R5',
              date: 'Feb 18, 2024',
              status: 'Returned'),
        ],
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String date;
  final String status;

  const HistoryItem(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.date,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(name),
        subtitle: Text(date),
        trailing: Text(status,
            style: TextStyle(
                color: status == 'Returned' ? Colors.green : Colors.orange)),
      ),
    );
  }
}
