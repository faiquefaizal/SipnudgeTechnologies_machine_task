import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// centralized source for all text styles used in the application.
///
/// Uses 'Urbanist' Google Font as the base.
class AppTypography {
  static TextStyle _baseUrbanist(double size, FontWeight weight, Color color) {
    return GoogleFonts.urbanist(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  /// Style for active navigation items.
  static TextStyle navActive = _baseUrbanist(15, FontWeight.w600, Colors.white);

  /// Style for inactive navigation items.
  static TextStyle navInactive = _baseUrbanist(
    11,
    FontWeight.w500,
    Colors.white54,
  );

  static TextStyle tabText(bool isSelected) {
    return _baseUrbanist(
      16,
      FontWeight.w700,
      isSelected ? Colors.white : Colors.black,
    );
  }

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
