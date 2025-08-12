import 'package:flutter/material.dart';
import 'package:layout_widgets/core/theme/theme_extensions.dart'; // context.customTheme için
import 'routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final builder = AppRoutes.all[settings.name];

    if (builder != null) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          final theme = context.customTheme;
          return Theme(data: theme, child: builder(context));
        },
      );
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        final theme = context.customTheme;
        return Theme(
          data: theme,
          child: Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
      },
    );
  }

  static Route<dynamic>? get initialRoute =>
      generateRoute(RouteSettings(name: AppRoutes.initialRoute));
}
