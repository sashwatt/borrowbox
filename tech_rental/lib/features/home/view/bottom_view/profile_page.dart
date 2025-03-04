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
  bool _isDarkMode = false; // Local state for dark mode toggle

  @override
  void initState() {
    super.initState();
    _userFuture = authDataSource.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    // Apply theme override based on local state (_isDarkMode)
    ThemeData themeData = _isDarkMode ? ThemeData.dark() : ThemeData.light();

    return Theme(
      data: themeData, // Override theme only for ProfilePage
      child: Scaffold(
        backgroundColor: _isDarkMode ? Colors.black : const Color(0xFF091E42),
        appBar: AppBar(
          title: const Text('Profile', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            // Toggle Theme Button
            IconButton(
              icon: Icon(
                _isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode; // Toggle local dark mode
                });
              },
            ),
          ],
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
                      // Profile Picture
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.yellow[700],
                        backgroundImage:
                            user.image != null && user.image!.isNotEmpty
                                ? NetworkImage(user.image!)
                                : const AssetImage('assets/images/profile.png')
                                    as ImageProvider,
                      ),
                      const SizedBox(height: 20),

                      // Username
                      Text(
                        user.username,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Email
                      Text(
                        user.email,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Edit Profile Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
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

                      // Logout Button
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
      ),
    );
  }
}
