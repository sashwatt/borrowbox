import 'package:flutter/material.dart';
import 'package:tech_rental/view/dashboard.dart';
import 'package:tech_rental/view/login_page.dart';
import 'package:tech_rental/view/onboard_screen.dart';
import 'package:tech_rental/view/signup_page.dart';
 

class BorrowBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BorrowBox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light, // Default light mode
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Dark mode theme
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system, // Automatically switch based on system setting

      // Define initial route
      initialRoute: '/onboarding',

      // Define routes
      routes: {
        '/onboarding': (context) => OnboardScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupPage(),
        '/dashboard': (context) => Dashboard(),
      },

      // Handle unknown routes
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => LoginScreen());
      },
    );
  }
}
