import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sensors_plus/sensors_plus.dart'; // Import the sensors package
import 'package:tech_rental/app/di/di.dart';
import 'package:tech_rental/features/auth/data/data_source/auth_remote_datasource/auth_remote_datasource.dart';
import 'package:tech_rental/features/auth/domain/entity/auth_entity.dart';
import 'package:tech_rental/features/auth/presentation/view/login_page.dart';
import 'package:tech_rental/features/auth/presentation/view_model/login/login_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<AuthEntity> _userFuture;
  final AuthRemoteDataSource authDataSource = AuthRemoteDataSource(Dio());
  bool _isDarkMode = false; // Local state for dark mode toggle

  // Variables for shake detection
  double x = 0.0, y = 0.0, z = 0.0;
  double previousX = 0.0, previousY = 0.0, previousZ = 0.0;
  static const double shakeThreshold = 300.0;

  @override
  void initState() {
    super.initState();
    _userFuture = authDataSource.getCurrentUser();

    // Listen to the accelerometer data for shake detection
    accelerometerEvents.listen((AccelerometerEvent event) {
      x = event.x;
      y = event.y;
      z = event.z;

      // Calculate change in acceleration
      double deltaX = x - previousX;
      double deltaY = y - previousY;
      double deltaZ = z - previousZ;

      // Calculate total movement
      double totalMovement =
          (deltaX * deltaX) + (deltaY * deltaY) + (deltaZ * deltaZ);

      // If total movement exceeds the threshold, trigger logout
      if (totalMovement > shakeThreshold) {
        _logoutUser();
      }

      // Update previous values
      previousX = x;
      previousY = y;
      previousZ = z;
    });
  }

  // Function to handle user logout
  void _logoutUser() async {
    // Clear the user's session (e.g., using SharedPreferences)
    // This should include clearing authentication data or session tokens
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider<LoginBloc>(
          create: (_) => getIt<LoginBloc>(),
          child: const LoginPage(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose of the accelerometer listener when the widget is disposed
    accelerometerEvents.drain();
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider<LoginBloc>(
                                create: (_) => getIt<LoginBloc>(),
                                child: const LoginPage(),
                              ),
                            ),
                          );
                        },
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
