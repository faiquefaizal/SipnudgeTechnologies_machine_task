// preff dev
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_typography.dart';

/// Definition of the global application theme.
///
/// Configures [ThemeData] with custom colors from [AppColors] and typography from [AppTypography].
class AppTheme {
  static ThemeData get main {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgGradientBottom,
      primaryColor: AppColors.primaryColor,

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: Brightness.dark,
        primary: AppColors.primaryColor,
        secondary: AppColors.activePurple,
      ),

      textTheme: GoogleFonts.urbanistTextTheme().copyWith(
        displayLarge: AppTypography.displayLarge,
        bodySmall: AppTypography.bodySmall,
        labelSmall: AppTypography.labelSmall,
        titleMedium: AppTypography.cardTitle,
      ),

      cardTheme: CardThemeData(
        color: AppColors.analysisBg,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
