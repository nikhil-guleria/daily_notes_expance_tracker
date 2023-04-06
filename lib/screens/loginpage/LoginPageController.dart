import 'package:daily_notes/utils/CommonUtils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../constants/Strings.dart';
import '../../localdb/DailyNotesDatabase.dart';
import '../../models/UsersData.dart';
import '../../routes/app_pages.dart';
import '../../utils/DialogBox.dart';
import '../../utils/StorageConstant.dart';

class LoginController extends GetxController {
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  late final Users userData;

  getUserData() async {
    List<Users> users = <Users>[];
    final List<Map<String, dynamic>> user = await DailyNotesDatabase.getUser(
        emailInputController.text);


    if ( user.isEmpty) {
      Get.dialog(
          DialogBox(title: error_alert,
              middleText: error_email,
              errorType: true,
              onConfirm: () => Get.back(),
              onCancel: ()=> Get.back(),
              cancelBtn: false),
          barrierDismissible: false
      );
      /*Get.defaultDialog(
        title: error_alert,
        middleText: error_email,
        textConfirm: btn_lbl_ok,
        onConfirm: (){
          Get.back();
        },
      );*/
    } else {
      users.assignAll(user.map((data) => Users.fromMap(data)).toList());
    userData = users[0];
    var password =  CommonUtils().decryptPassword(userData.password);
      if (password == passwordInputController.text) {
        processLogin();
      }
      else {
        Get.dialog(
            DialogBox(title: error_alert,
                middleText: error_password,
                errorType: true,
                onConfirm: () => Get.back(),
                onCancel: ()=> Get.back(),
                cancelBtn: false),
            barrierDismissible: false
        );

        //   showError
        /*Get.defaultDialog(
          title: error_alert,
          middleText: error_password,
          textConfirm: btn_lbl_ok,
          onConfirm: (){
            Get.back();
          },
        );*/
      }
    }
  }


  void processLogin() {
    final userDetail = GetStorage();
    userDetail.write(StorageConstant.USER_EMAIL, emailInputController.text);
   Get.offNamed(Routes.DASHBOARD);
  }

  loginValidation() {
      getUserData();

    }
  /*getUserDetails(UserData userData){
    emailInputController.text = userData.result!.email!;
  }*/
}
