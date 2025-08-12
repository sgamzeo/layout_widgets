import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/core/router.dart';
import 'package:layout_widgets/core/routes.dart';
import 'package:layout_widgets/core/theme/theme_extensions.dart';
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
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          onGenerateRoute: AppRouter.generateRoute,
          builder: (context, child) {
            final theme = context.customTheme;
            return Theme(
              data: theme,
              child: DevicePreview.appBuilder(context, child!),
            );
          },
        );
      },
    );
  }
}
