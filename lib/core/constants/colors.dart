import 'package:flutter/material.dart';

class AppColorScheme {
  static const ColorScheme finance = ColorScheme(
    primary: Color(0xFF0466C8), // true blue
    primaryContainer: Color(0xFF0353A4), // sapphire
    secondary: Color(0xFF023E7D), // yale blue
    secondaryContainer: Color(0xFF002855), // oxford blue 1
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFF8F9FA),
    error: Color(0xFFD90429), // fire Engine red
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF001233), // oxford blue 3 (text)
    onBackground: Color(0xFF001233),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static const ColorScheme primary = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFFF5D8F), // french rose
    onPrimary: Colors.white,
    secondary: Color(0xFFFF97B7), // baker miller pink
    onSecondary: Colors.white,
    background: Color(0xFFFADDE1), // misty rose
    onBackground: Color(0xFFF4ACB7), // cherry blossom pink
    surface: Color(0xFFFFC4D6), // orchid pink
    onSurface: Color(0xFFF4ACB7), // cherry blossomPink
    error: Colors.redAccent,
    onError: Colors.white,
  );

  static const ColorScheme smartHome = ColorScheme(
    primary: Color(0xFF0985FA), // azure
    primaryContainer: Color(0xFF0A254C), // oxford blue 4
    secondary: Color(0xFF7DCFB6), // tiffany Blue
    secondaryContainer: Color(0xFF669BBC), // air superiority blue
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFF5F7FA),
    error: Color(0xFFD90429), // fire engine red
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF001233), // oxford blue 3
    onSurface: Color(0xFF0A254C), // oxford blue 4
    onBackground: Color(0xFF0A254C),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  // Comedy club theme colorscheme
  static const ColorScheme comedyClub = ColorScheme(
    primary: Color(0xFFFF93E1), // persian pink
    primaryContainer: Color(0xFF261447), // russian violet
    secondary: Color(0xFF1F7A8C), // teal
    secondaryContainer: Color(0xFF594236), // umber
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFE0E1E9), // ghost white
    error: Color(0xFFD90429),
    onPrimary: Color(0xFF261447), // russian violet
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF261447),
    onBackground: Color(0xFF261447),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  // Travel theme colorscheme
  static const ColorScheme travel = ColorScheme(
    primary: Color(0xFFEDAE49), // hunyadi yellow
    primaryContainer: Color(0xFF00798C), // caribbean current
    secondary: Color(0xFFD1495B), // amaranth
    secondaryContainer: Color(0xFF30638E), // lapis lazuli
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFF5F7FA),
    error: Color(0xFFD90429),
    onPrimary: Color(0xFF001233), // oxford blue 3
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF001233),
    onBackground: Color(0xFF001233),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static const Color delftBlue = Color(0xFF33415C);
  static const Color paynesGray = Color(0xFF5C677D);
  static const Color slateGray = Color(0xFF7D8597);
  static const Color coolGray = Color(0xFF979DAC);
  static const Color powderBlue = Color(0xFF9BAFC7);
}
