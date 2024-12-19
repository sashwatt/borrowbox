import 'package:flutter/material.dart';

class AppTheme {
  // Primary color scheme
  static const Color primaryColor = Color.fromRGBO(19, 34, 87, 1);
  static const Color accentColor =
      Color.fromRGBO(255, 193, 7, 1); // Yellow color for accents

  // Text styles
  static const TextStyle headingTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle subheadingTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
  );

  // Light Theme
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        selectedItemColor: accentColor,
        unselectedItemColor: Colors.white,
      ),
      textTheme: const TextTheme(
        titleLarge: headingTextStyle,
        bodyMedium: subheadingTextStyle,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    );
  }

  // Dark Theme
  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      hintColor: accentColor,
      scaffoldBackgroundColor: primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        selectedItemColor: accentColor,
        unselectedItemColor: Colors.white70,
      ),
      textTheme: TextTheme(
        titleLarge: headingTextStyle.copyWith(color: Colors.white),
        bodyMedium: subheadingTextStyle.copyWith(color: Colors.white70),
      ),
    );
  }
}
