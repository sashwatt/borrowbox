// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(156, 19, 34, 87),
//       appBar: AppBar(
//         title: const Text('Profile', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.black,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Profile Image
//             const CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/images/profile.png'),
//             ),
//             const SizedBox(height: 10),
//             const Text('Sambardhan',
//                 style: TextStyle(color: Colors.white, fontSize: 20)),
//             const Text('sambardhan95@gmail.com',
//                 style: TextStyle(color: Colors.white70, fontSize: 14)),
//             const SizedBox(height: 20),

//             // Buttons
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.yellow[700],
//               ),
//               child: const Text('Edit Profile'),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: const Text('Logout', style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_rental/features/auth/data/data_source/auth_remote_datasource/auth_remote_datasource.dart';
import 'package:tech_rental/features/auth/domain/entity/auth_entity.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<AuthEntity> _userFuture;
  final AuthRemoteDataSource authDataSource = AuthRemoteDataSource(Dio());

  @override
  void initState() {
    super.initState();
    _userFuture = authDataSource.getCurrentUser(); // Fetch user data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF091E42),
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<AuthEntity>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child:
                  Text("No User Data", style: TextStyle(color: Colors.white)),
            );
          }

          AuthEntity user = snapshot.data!;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.yellow[700],
                  backgroundImage: user.image != null && user.image!.isNotEmpty
                      ? NetworkImage(user.image!)
                      : const AssetImage('assets/images/profile.png')
                          as ImageProvider,
                ),
                const SizedBox(height: 10),
                Text(user.username,
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
                Text(user.email,
                    style: GoogleFonts.poppins(
                        color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700]),
                  child: const Text('Edit Profile'),
                ),
                TextButton(
                  onPressed: () {},
                  child:
                      const Text('Logout', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
