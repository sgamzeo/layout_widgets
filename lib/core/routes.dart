import 'package:flutter/material.dart';
import 'package:layout_widgets/features/comedy_club/screens/comedy_club_page.dart';
import 'package:layout_widgets/features/fin_smart/screens/finance_page.dart';
import 'package:layout_widgets/features/future_tech/screens/smart_home_page.dart';
import 'package:layout_widgets/features/home/screens/home_page.dart';
import 'package:layout_widgets/features/travel_ease/screens/travel_page.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String finance = '/finance';
  static const String travel = '/travel';
  static const String smartHome = '/smart_home';
  static const String comedy = '/comedy';

  static Map<String, WidgetBuilder> get all => {
    initialRoute: (context) => HomePage(),
    finance: (context) => const FinancePage(),
    travel: (context) => const TravelPage(),
    smartHome: (context) => const SmartHomePage(),
    comedy: (context) => const ComedyClubPage(),
  };
}
