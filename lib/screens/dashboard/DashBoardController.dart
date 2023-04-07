import 'package:daily_notes/screens/activity/Activity.dart';
import 'package:daily_notes/screens/report/Report.dart';
import 'package:daily_notes/screens/settings/Settings.dart';
import 'package:daily_notes/screens/transaction/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../routes/app_pages.dart';
import '../settings/SettingsController.dart';

class DashBoardController extends GetxController {
  var currentIndex = 0.obs;
  static DashBoardController get to => Get.find();
  final pages = <String>[Routes.ACTIVITY, Routes.TRANSACTION, Routes.REPORT, Routes.SETTINGS];

  void changePage(int index) {
    currentIndex.value = index;

    Get.toNamed(pages[index], id: 1);
  }
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.ACTIVITY) {
      return GetPageRoute(
        settings: settings,
        page: () =>Activity(),
        transitionDuration: Duration(milliseconds: 10)
      );
    }

    if (settings.name == Routes.TRANSACTION) {
      return GetPageRoute(
        settings: settings,
        page: () => Transaction(),
          transitionDuration: Duration(milliseconds: 10)
      );
    }

    if (settings.name == Routes.REPORT) {
      return GetPageRoute(
        settings: settings,
        page: () => Report(),
          transitionDuration: Duration(milliseconds: 10)
      );
    }
    if (settings.name == Routes.SETTINGS) {
      return GetPageRoute(
        settings: settings,
        page: () => Settings(),
          transitionDuration: Duration(milliseconds: 10)
      );
    }

    return null;
  }
}
