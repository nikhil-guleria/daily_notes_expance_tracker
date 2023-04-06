import 'package:daily_notes/screens/dashboard/DashBoard.dart';
import 'package:get/get.dart';

import '../screens/loginpage/LoginPage.dart';
import '../screens/signuppage/SignUpPage.dart';
import 'app_pages.dart';

class AppPages {

  static const INITIAL_ROUTES = Routes.LOGINPAGE;
  static const INITIAL_DASHBOARD = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: Routes.LOGINPAGE,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.SIGNUPPAGE,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashBoard(),
    ),
  ];

}