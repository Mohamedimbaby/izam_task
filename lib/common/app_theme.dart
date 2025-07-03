import 'package:flutter/material.dart';

final ThemeData posCartTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF1976D2), // POS systems often use strong primary colors
  primaryColorLight: const Color(0xFF63A4FF),
  primaryColorDark: const Color(0xFF004BA0),
  scaffoldBackgroundColor: const Color(0xFFF5F5F5),
  cardColor: Colors.white,
  canvasColor: Colors.white,

  // AppBar theme
  appBarTheme: const AppBarTheme(
    color: Color(0xFF1976D2),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  // Text theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87),
    displayMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
    labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
  ),

  // Elevated buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFFA000),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  ),

  // Cards for cart items
  cardTheme: CardTheme(
    elevation: 2,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),

  // Input fields
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  ),

  // Icon buttons
  iconTheme: const IconThemeData(
    color: Colors.black87,
    size: 28,
  ),

  // Floating Action Button for adding items
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFFA000),
    foregroundColor: Colors.white,
  ),
);
