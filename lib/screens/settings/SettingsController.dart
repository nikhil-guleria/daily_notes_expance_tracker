import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/Strings.dart';
import '../../routes/app_pages.dart';
import '../../utils/DialogBox.dart';
import '../../utils/StorageConstant.dart';


class SettingsController extends GetxController {


  logOut(){
    Get.dialog(
        DialogBox(title: alert_logout_lbl,
            middleText: alert_logout,
            icon: Icons.logout,
            iconColor: Colors.orange,
            onConfirm: (){processLogout();},
            onCancel: ()=> Get.back(),
            cancelBtn: true),
        barrierDismissible: false
    );
  }
  processLogout(){
    var storage = GetStorage();
    storage.remove(StorageConstant.USER_EMAIL);
    Get.offAllNamed(Routes.LOGINPAGE);
  }
}