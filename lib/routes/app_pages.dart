import 'package:get/get.dart';

import '../auth/bindings/load_auth_binding.dart';
import '../auth/bindings/login_binding.dart';
import '../auth/views/load_auth_page.dart';
import '../auth/views/login_page.dart';
import '../pages/dashboard/dashboard_binding.dart';
import '../pages/dashboard/dashboard_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOAD_AUTH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.LOAD_AUTH,
      page: () => const LoadAuthPage(),
      binding: LoadAuthBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
  ];
}
