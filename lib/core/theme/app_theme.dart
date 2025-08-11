import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeFromColorScheme(ColorScheme scheme) {
    return ThemeData(
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: scheme.onBackground),
        bodyMedium: TextStyle(color: scheme.onBackground),
      ),
    );
  }
}
