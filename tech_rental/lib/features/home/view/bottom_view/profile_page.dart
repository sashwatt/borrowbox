// import 'package:flutter/material.dart';

// import 'package:dio/dio.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tech_rental/features/auth/data/data_source/auth_remote_datasource/auth_remote_datasource.dart';
// import 'package:tech_rental/features/auth/domain/entity/auth_entity.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   late Future<AuthEntity> _userFuture;
//   final AuthRemoteDataSource authDataSource = AuthRemoteDataSource(Dio());

//   @override
//   void initState() {
//     super.initState();
//     _userFuture = authDataSource.getCurrentUser(); // Fetch user data
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF091E42),
//       appBar: AppBar(
//         title: const Text('Profile', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: FutureBuilder<AuthEntity>(
//         future: _userFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text(
//                 "Error: ${snapshot.error}",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             );
//           } else if (!snapshot.hasData) {
//             return const Center(
//               child:
//                   Text("No User Data", style: TextStyle(color: Colors.white)),
//             );
//           }

//           AuthEntity user = snapshot.data!;

//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Colors.yellow[700],
//                   backgroundImage: user.image != null && user.image!.isNotEmpty
//                       ? NetworkImage(user.image!)
//                       : const AssetImage('assets/images/profile.png')
//                           as ImageProvider,
//                 ),
//                 const SizedBox(height: 10),
//                 Text(user.username,
//                     style:
//                         GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
//                 Text(user.email,
//                     style: GoogleFonts.poppins(
//                         color: Colors.white70, fontSize: 14)),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.yellow[700]),
//                   child: const Text('Edit Profile'),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child:
//                       const Text('Logout', style: TextStyle(color: Colors.red)),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Profile Picture with Border and Shadow
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 85,
                          backgroundColor: Colors.transparent,
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.yellow[700],
                            backgroundImage: user.image != null &&
                                    user.image!.isNotEmpty
                                ? NetworkImage(user.image!)
                                : const AssetImage('assets/images/profile.png')
                                    as ImageProvider,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 6,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.yellow,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Username Styling
                    Text(
                      user.username,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Email Styling
                    Text(
                      user.email,
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Edit Profile Button Styling
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 8,
                      ),
                      child: Text(
                        'Edit Profile',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Logout Button Styling
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
