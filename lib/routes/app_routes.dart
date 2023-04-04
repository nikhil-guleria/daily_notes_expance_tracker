import 'package:get/get.dart';

import '../screens/loginpage/LoginPage.dart';
import '../screens/signuppage/SignUpPage.dart';
import 'app_pages.dart';

class AppPages {

  static const INITIAL_ROUTES = Routes.LOGINPAGE;

  static final routes = [
    GetPage(
      name: Routes.LOGINPAGE,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.SIGNUPPAGE,
      page: () => SignUpPage(),
    ),
  ];

}