// import 'package:flutter/material.dart';

// class DashboardHomePage extends StatelessWidget {
//   const DashboardHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Search Bar
//             Container(
//               margin: const EdgeInsets.only(bottom: 20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 children: [
//                   const Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search',
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.filter_alt, color: Colors.black87),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ),
//             // Gadgets Section
//             const Text(
//               'Gadgets',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 CategoryItem(
//                     icon: Icons.videogame_asset_rounded, label: 'PlayStation'),
//                 CategoryItem(icon: Icons.laptop, label: 'Laptop'),
//                 CategoryItem(icon: Icons.camera_alt, label: 'Camera'),
//                 CategoryItem(icon: Icons.phone_iphone, label: 'Phone'),
//               ],
//             ),
//             const SizedBox(height: 20),
//             // Hot Deals Section
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Hot deals',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Handle view all click
//                   },
//                   child: Text(
//                     'View all...',
//                     style: TextStyle(
//                       color: Colors.yellow[700],
//                       fontSize: 14,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             // Hot Deals Cards
//             const Column(
//               children: [
//                 HotDealCard(
//                   imagePath: 'assets/images/ps5.png',
//                   category: 'PlayStation',
//                   name: 'PS5',
//                   price: 'NPR 1400',
//                 ),
//                 SizedBox(height: 10),
//                 HotDealCard(
//                   imagePath: 'assets/images/laptop.png',
//                   category: 'Laptop',
//                   name: 'MacBook Air M2',
//                   price: 'NPR 1400',
//                 ),
//                 SizedBox(height: 10),
//                 HotDealCard(
//                   imagePath: 'assets/images/camera.png',
//                   category: 'Camera',
//                   name: 'Canon EOS R5',
//                   price: 'NPR 1400',
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
