import 'package:gita_app/pages/detail_page/detail_page.dart';
import 'package:gita_app/pages/home_page/home_page.dart';
import 'package:gita_app/pages/sloka_page/sloka_page.dart';
import 'package:gita_app/pages/splash_screen/splash_screen.dart';

import 'headers.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes appRoutes = AppRoutes._();

  String homePage = '/';

  Map<String, Widget Function(BuildContext)> route = {
    "/": (context) => const HomePage(),
    "splash_screen": (context) => const SplashScreen(),
    "Detail_Page": (context) => const DetailPage(),
    "Sloka_Page": (context) => const SlokaPage(),
  };
}
