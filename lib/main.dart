import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout_widgets/core/constants/colors.dart';
import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/core/routes.dart';
import 'package:layout_widgets/core/theme/app_theme.dart';
// import 'package:flutter/rendering.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        Dimens.init(context);
        return MaterialApp(
          // showPerformanceOverlay: true,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeFromColorScheme(AppColorScheme.primary),

          builder: DevicePreview.appBuilder,
          routes: AppRoutes.routes,
          initialRoute: AppRoutes.home,
        );
      },
    );
  }
}
