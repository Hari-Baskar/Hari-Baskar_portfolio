import 'package:flutter/material.dart';

class AppColors {
  // ---------------- Dark Mode ----------------
  static const darkBackground = Color(
    0xFF000000,
  ); // Pure black like Vercel/Linear
  static const darkSecondaryBackgroundColor = Color(0xFF0A0A0A);
  static const darkCard = Color(0xFF111111);
  static const darkBorder = Color(0xFF222222);
  static const darkText = Color(0xFFEDEDED);
  static const darkSecondaryText = Color(0xFFA1A1AA);
  static const darkSecondaryButton = Color(0xFF1A1A1A);
  static const darkAppBarBackground = Color(0xFF000000);

  // ---------------- Light Mode ----------------
  static const lightBackground = Color(0xFFFFFFFF); // Pure white
  static const lightSecondaryBackgroundColor = Color(0xFFFAFAFA);
  static const lightCard = Color(0xFFFFFFFF);
  static const lightBorder = Color(0xFFEAEAEA);
  static const lightText = Color(0xFF171717);
  static const lightSecondaryText = Color(0xFF666666);
  static const lightSecondaryButton = Color(0xFFF5F5F5);
  static const lightAppBarBackground = Color(0xFFFFFFFF);

  // ---------------- Functional ----------------
  static const primaryAccent = Color.fromARGB(255, 6, 99, 53); // Premium Green
  static const buttonColor = Color.fromARGB(255, 6, 99, 53); // Premium Green
  static const green = Color.fromARGB(255, 6, 99, 53);
  static const error = Color(0xFFEF4444);
  static const white = Colors.white;
  static const black = Colors.black;
}
