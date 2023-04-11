import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/Strings.dart';
import '../../localdb/DailyNotesDatabase.dart';
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
  deleteAccount(){
    Get.dialog(
        DialogBox(title: alert_delete,
            middleText: alert_delete_text,
            icon: Icons.delete,
            iconColor: Colors.red,
            onConfirm: (){processDelete();},
            onCancel: ()=> Get.back(),
            cancelBtn: true),
        barrierDismissible: false
    );
  }
  processDelete(){
    var storage = GetStorage();
     DailyNotesDatabase.deleteUser( storage.read(StorageConstant.USER_EMAIL));
    storage.remove(StorageConstant.USER_EMAIL);
    Get.offAllNamed(Routes.LOGINPAGE);
  }

}