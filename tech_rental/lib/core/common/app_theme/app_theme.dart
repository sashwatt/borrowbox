import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: Colors.blue,
      fontFamily: 'Oswald Semi Bold',
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.yellow,
          fontFamily: 'Montserrat Bold Italic',
          fontSize: 20,
        ),
      ),
      scaffoldBackgroundColor: const Color.fromRGBO(19, 34, 87, 100),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        displayLarge: TextStyle(color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
