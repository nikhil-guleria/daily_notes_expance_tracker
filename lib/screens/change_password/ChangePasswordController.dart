import 'package:daily_notes/utils/DialogBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/Strings.dart';
import '../../localdb/DailyNotesDatabase.dart';
import '../../utils/CommonUtils.dart';
import '../../utils/StorageConstant.dart';

class ChangePasswordController extends GetxController{
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
 // var password;
  var storage = GetStorage();
  var passwordVisible = false.obs;
  var confirmPasswordVisible = false.obs;
  var errorPassword = ''.obs;
  var confirmPasswordCheck = ''.obs;
  var  isValid = false.obs;
  var oldPassword = ''.obs;
  @override
  void onInit() {
    super.onInit();
    passwordVisible.value = true;
    confirmPasswordVisible.value =true;
  }
  validatePassword(String value){
    if(value.isNotEmpty && validateStructure(value))
    {
      errorPassword.value = "";
      isValid.value = true;
    } else {errorPassword.value = error_password;
    isValid.value =false;}
    return isValid.value;
  }
  oldPasswordValidate(String value){
    if (value.isNotEmpty){
      oldPassword.value = "";
      isValid.value = true;
    }
    else {oldPassword.value ='Password Cannot be Empty';
    isValid.value = false;}
    return isValid.value;
  }

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
  confirmPassword(String value){
    if(value.isNotEmpty && value == newPasswordController.text){
      confirmPasswordCheck.value = '';
      isValid.value =true;
    }else {confirmPasswordCheck.value = error_confirm_password;
    isValid.value = false;}
    return isValid.value;
  }
  visible(){
    passwordVisible.value  = !passwordVisible.value;
  }
  confirm(){
    confirmPasswordVisible.value  = !confirmPasswordVisible.value;
  }
  confirmPasswordValidation() {
    if(
        validatePassword(newPasswordController.text)&&confirmPassword(confirmPasswordController.text) && oldPasswordValidate(oldPasswordController.text)
       )
    {
      getPassword();
    }
    else {
    if(!validatePassword(newPasswordController.text)){}
    if (!confirmPassword(confirmPasswordController.text)){}
    if (!oldPasswordValidate(oldPasswordController.text)) {}
  }}

  getPassword() async{

    final List<Map<String, dynamic>> user = await DailyNotesDatabase.getUserPassword(
        storage.read(StorageConstant.USER_EMAIL));
    //password = user[0]['password'];
    var password =  CommonUtils().decryptPassword(user[0]['password']);
    if (password == oldPasswordController.text) {
      updatePassword();
      Get.dialog(DialogBox(title: 'Password Changed',
          middleText: 'Your password changed successfully',
          onConfirm: (){Get.close(2);},
          onCancel: (){Get.back();},
          cancelBtn: false,
          icon: Icons.check_circle,
          iconColor: Colors.deepOrange),
      barrierDismissible: false);

    }
    else {
      Get.dialog(DialogBox(title: 'Password Error',
          middleText: 'old password does not match',
          onConfirm: (){Get.back();},
          onCancel: (){Get.back();},
          cancelBtn: false,
          icon: Icons.error,
          iconColor: Colors.red));
    }
  }
updatePassword(){
  Map<String, dynamic> map = {'password' : '${CommonUtils().encryptPassword(confirmPasswordController.text)}'};
  return DailyNotesDatabase.updatePassword( storage.read(StorageConstant.USER_EMAIL), map);
}
}