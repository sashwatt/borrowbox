import 'package:flutter/material.dart';
import 'package:tech_rental/app/view/dashboard.dart';
import 'package:tech_rental/app/view/login_page.dart';
import 'package:tech_rental/app/view/onboard_screen.dart';
import 'package:tech_rental/app/view/signup_page.dart';

import '../core/common/app_theme/app_theme.dart';

class BorrowBoxApp extends StatelessWidget {
  const BorrowBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BorrowBox',
      theme: AppTheme.theme,
      themeMode: ThemeMode.system,

      // Define initial route
      initialRoute: '/onboarding',

      // Define routes
      routes: {
        '/onboarding': (context) => const OnboardScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => SignupPage(),
        '/dashboard': (context) => const Dashboard(),
      },

      // Handle unknown routes
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      },
    );
  }
}
