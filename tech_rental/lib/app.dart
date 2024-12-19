import 'package:flutter/material.dart';
import 'package:tech_rental/view/dashboard.dart';
import 'package:tech_rental/view/login_page.dart';
import 'package:tech_rental/view/onboard_screen.dart';
import 'package:tech_rental/view/signup_page.dart';

import 'core/app_theme/app_theme.dart'; // Import your custom theme

class BorrowBoxApp extends StatelessWidget {
  const BorrowBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BorrowBox',
      theme: AppTheme.lightTheme(), // Use the custom light theme
      darkTheme: AppTheme.darkTheme(), // Use the custom dark theme
      themeMode:
          ThemeMode.system, // Automatically choose based on system setting

      // Define initial route
      initialRoute: '/onboarding',

      // Define routes
      routes: {
        '/onboarding': (context) => const OnboardScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupPage(),
        '/dashboard': (context) => const Dashboard(),
      },

      // Handle unknown routes
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => LoginScreen());
      },
    );
  }
}
