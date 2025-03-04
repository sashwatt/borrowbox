import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(156, 19, 34, 87),
      appBar: AppBar(title: const Text('Cart')),
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

// import 'package:flutter/material.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(156, 19, 34, 87),
//       appBar: AppBar(
//         title: const Text('Cart'),
//         backgroundColor: const Color(0xFF004D40), // Darker color for AppBar
//         elevation: 4,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: const [
//           CartItem(
//               imagePath: 'assets/images/ps5.png',
//               name: 'PS5',
//               price: '\$499.99',
//               quantity: 1),
//           CartItem(
//               imagePath: 'assets/images/laptop.png',
//               name: 'MacBook Air M2',
//               price: '\$1199.99',
//               quantity: 1),
//           CartItem(
//               imagePath: 'assets/images/camera.png',
//               name: 'Canon EOS R5',
//               price: '\$3899.99',
//               quantity: 1),
//         ],
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 16.0),
//         child: FloatingActionButton.extended(
//           onPressed: () {
//             // Implement checkout logic
//           },
//           label: const Text('Checkout'),
//           icon: const Icon(Icons.payment),
//           backgroundColor: Colors.green,
//         ),
//       ),
//     );
//   }
// }

// class CartItem extends StatelessWidget {
//   final String imagePath;
//   final String name;
//   final String price;
//   final int quantity;

//   const CartItem(
//       {super.key,
//       required this.imagePath,
//       required this.name,
//       required this.price,
//       required this.quantity});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ListTile(
//         leading: ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child:
//               Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
//         ),
//         title: Text(
//           name,
//           style: const TextStyle(
//               fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//         ),
//         subtitle: Text(
//           'Quantity: $quantity',
//           style: const TextStyle(color: Colors.grey),
//         ),
//         trailing: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               price,
//               style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color: Colors.green),
//             ),
//             IconButton(
//               icon: const Icon(Icons.delete, color: Colors.red),
//               onPressed: () {
//                 // Implement item removal from cart logic
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
