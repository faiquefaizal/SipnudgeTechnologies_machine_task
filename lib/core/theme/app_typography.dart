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

  // Chart Titles
  static TextStyle sectionHeader = _baseUrbanist(
    18,
    FontWeight.w700,
    Colors.white,
  );
}
