import 'package:daily_notes/utils/CommonUtils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/Strings.dart';
import '../../localdb/DailyNotesDatabase.dart';
import '../../models/UsersData.dart';
import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  late final Users userData;

  getUserData() async {
    List<Users> users = <Users>[];
    final List<Map<String, dynamic>> user = await DailyNotesDatabase.getUser(
        emailInputController.text);
    users.assignAll(user.map((data) => Users.fromMap(data)).toList());
    userData = users[0];

    if ( userData.email != emailInputController.text) {
      Get.defaultDialog(
        title: error_alert,
        middleText: error_email,
        textConfirm: btn_lbl_ok,
        onConfirm: (){
          Get.back();
        },
      );
    } else {
    var password =  CommonUtils().decryptPassword(userData.password);
      if (password == passwordInputController.text) {
        processLogin();
      }
      else {
        //   showError
        Get.defaultDialog(
          title: error_alert,
          middleText: error_password,
          textConfirm: btn_lbl_ok,
          onConfirm: (){
            Get.back();
          },
        );
      }
    }
  }


  void processLogin() {
    /*// save email to storage
    final userDetail = GetStorage();
    userDetail.write(StorageConstant.USER_EMAIL, emailInputController.text);
    // redirect user to dashboard*/
   Get.offNamed(Routes.DASHBOARD);
  }

  loginValidation() {
      getUserData();

    }
  /*getUserDetails(UserData userData){
    emailInputController.text = userData.result!.email!;
  }*/
}
