import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData themeFromColorScheme(ColorScheme scheme) {
    return ThemeData(
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.background,
        foregroundColor: scheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
        ),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        TextTheme(
          bodyLarge: TextStyle(color: scheme.onBackground),
          bodyMedium: TextStyle(color: scheme.onBackground),
        ),
      ),
    );
  }
}
