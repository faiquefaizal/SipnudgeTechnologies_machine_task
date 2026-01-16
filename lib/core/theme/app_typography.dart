import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  // The base font configuration
  static TextStyle _baseUrbanist(double size, FontWeight weight, Color color) {
    return GoogleFonts.urbanist(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  // Navbar: Active State
  static TextStyle navActive = _baseUrbanist(15, FontWeight.w600, Colors.white);

  // Navbar: Inactive State
  static TextStyle navInactive = _baseUrbanist(
    11,
    FontWeight.w500,
    Colors.white54,
  );

  // Analysis Header: Tab Text
  static TextStyle tabText(bool isSelected) {
    return _baseUrbanist(
      16,
      FontWeight.w700,
      isSelected ? Colors.white : Colors.black,
    );
  }

  // Analysis Header: Date Range
  static TextStyle dateRangeHeader = _baseUrbanist(
    18,
    FontWeight.w600,
    Colors.white,
  );

  static TextStyle cardTitle = _baseUrbanist(20, FontWeight.w700, Colors.black);

  static TextStyle labelSmall = _baseUrbanist(12, FontWeight.w500, Colors.grey);

  static TextStyle displayLarge = _baseUrbanist(
    28,
    FontWeight.bold,
    Colors.white,
  );

  static TextStyle bodySmall = _baseUrbanist(
    14,
    FontWeight.normal,
    Colors.white,
  );
}
