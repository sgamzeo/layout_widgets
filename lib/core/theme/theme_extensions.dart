import 'package:flutter/material.dart';
import 'package:layout_widgets/core/constants/colors.dart';
import '../theme/app_theme.dart';

ThemeType currentThemeType = ThemeType.primary;

enum ThemeType { primary, finance, travel, smartHome, comedyClub }

extension ContextThemeExtension on BuildContext {
  ThemeType get routeBasedThemeType {
    final routeName = ModalRoute.of(this)?.settings.name ?? '';

    if (routeName.contains('finance')) return ThemeType.finance;
    if (routeName.contains('travel')) return ThemeType.travel;
    if (routeName.contains('smart_home')) return ThemeType.smartHome;
    if (routeName.contains('comedy')) return ThemeType.comedyClub;

    return ThemeType.primary;
  }

  ColorScheme get autoColorScheme {
    final type = routeBasedThemeType;

    switch (type) {
      case ThemeType.finance:
        return AppColorScheme.finance;
      case ThemeType.travel:
        return AppColorScheme.travel;
      case ThemeType.smartHome:
        return AppColorScheme.smartHome;
      case ThemeType.comedyClub:
        return AppColorScheme.comedyClub;
      case ThemeType.primary:
        return AppColorScheme.primary;
    }
  }

  ThemeData get customTheme => AppTheme.themeFromColorScheme(autoColorScheme);
}
