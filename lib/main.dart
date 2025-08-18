import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:layout_widgets/core/constants/dimens.dart';
import 'package:layout_widgets/core/router.dart';
import 'package:layout_widgets/core/routes.dart';
import 'package:layout_widgets/core/theme/theme_extensions.dart';
import 'package:layout_widgets/features/comedy_club/cubits/comedian_cubit.dart';
import 'package:layout_widgets/features/comedy_club/cubits/comedy_show_cubit.dart';
import 'package:layout_widgets/features/comedy_club/data/comedian_repository.dart';
import 'package:layout_widgets/features/comedy_club/data/comedy_show_repository.dart';
import 'package:layout_widgets/features/fin_smart/cubits/account_cubit.dart';
import 'package:layout_widgets/features/fin_smart/cubits/transaction_cubit.dart';
import 'package:layout_widgets/features/fin_smart/data/account_repository.dart';
import 'package:layout_widgets/features/fin_smart/data/transactions_repository.dart';
import 'package:layout_widgets/features/future_tech/cubits/device_cubits.dart';
import 'package:layout_widgets/features/travel_ease/cubits/destination_cubit.dart';
import 'package:layout_widgets/features/travel_ease/cubits/trip_cubit.dart';
import 'package:layout_widgets/features/travel_ease/data/destination_repository.dart';
import 'package:layout_widgets/features/travel_ease/data/trip_repository.dart';
// import 'package:flutter/rendering.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ComedyShowCubit(ComedyShowRepository())),
          BlocProvider(create: (_) => ComedianCubit(ComedianRepository())),
          BlocProvider(
            create: (_) => DestinationCubit(DestinationRepository()),
          ),
          BlocProvider(create: (_) => TripCubit(TripRepository())),
          BlocProvider(create: (_) => DeviceCubit()),
          BlocProvider(
            create: (_) =>
                TransactionCubit(repository: TransactionRepository()),
          ),
          BlocProvider(
            create: (_) => AccountCubit(repository: AccountRepository()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
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
