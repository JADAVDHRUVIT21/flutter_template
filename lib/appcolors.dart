import 'package:flutter/material.dart';

class AppColors {
  // Basic Colors
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color gray = Colors.grey;

  // Backgrounds & Surfaces
  static const Color background = Color(0xFFF5F5F5); // Light Gray
  static const Color surface = white;
  static const Color divider = Color(0xFFE0E0E0);    // Divider Gray

  // Text Colors
  static const Color textPrimary = black;
  static const Color textSecondary = gray;
  static const Color textDisabled = gray;

  // Misc
  static const Color transparent = Colors.transparent;

  // Border Colors
  static const Color borderLight = Color(0xFFE0E0E0); // Light Gray
  static const Color borderGray = Color(0xFFBDBDBD);  // fixed capitalization
  static const Color borderDark = black;

  // Extended Text Colors
  static const Color textBlack = Color(0xFF000000);       // Pure black
  static const Color textDarkGray = Color(0xFF333333);    // Near black
  static const Color textWhite = Color(0xFFFFFFFF);       // Pure white
  static const Color textGray = Color(0xFFBDBDBD);   // Near white

  // Label Colors
  static const Color labelBlack = Color(0xFF000000);     // Dark gray, for strong labels
  static const Color labelGray = Color(0xFF757575);   // Medium gray, for secondary labels
  static const Color labelLightGray = Color(0xFFBDBDBD);    // Light gray, for disabled labels
  static const Color labelWhite = white;                   // For dark backgrounds
}
