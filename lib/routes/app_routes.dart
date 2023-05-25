import 'package:daily_notes/screens/activity/Activity.dart';
import 'package:daily_notes/screens/dashboard/DashBoard.dart';
import 'package:daily_notes/screens/profile_settings/ProfileSettings.dart';
import 'package:daily_notes/screens/report/Report.dart';
import 'package:daily_notes/screens/settings/Settings.dart';
import 'package:daily_notes/screens/transaction/Transaction.dart';
import 'package:get/get.dart';

import '../screens/change_password/ChangePassword.dart';
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
    GetPage(
      name: Routes.ACTIVITY,
      page: () => Activity(),
    ),
    GetPage(
      name: Routes.TRANSACTION,
      page: () => Transaction(),
    ),
    GetPage(
      name: Routes.REPORT,
      page: () => Report(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => Settings(),
    ),
    GetPage(
      name: Routes.PROFILESETTINGS,
      page: () => ProfileSettings(),
    ),
    GetPage(
      name: Routes.CHANGEPASSWORD,
      page: () => ChangePassword(),
    ),
  ];

}