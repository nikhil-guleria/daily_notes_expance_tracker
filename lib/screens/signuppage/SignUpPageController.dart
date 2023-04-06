import 'package:daily_notes/utils/CommonUtils.dart';
import 'package:daily_notes/utils/DialogBox.dart';
import 'package:email_validator/email_validator.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:base64/base64.dart';

import '../../constants/Strings.dart';
import '../../localdb/DailyNotesDatabase.dart';
import '../../models/UsersData.dart';
class SignUpController extends GetxController{
  TextEditingController emailInputController = TextEditingController();
  TextEditingController usernameInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController confirmPasswordInputController = TextEditingController();
  TextEditingController phoneInputController = TextEditingController();
  var passwordVisible = false.obs;
  var confirmPasswordVisible = false.obs;
  var errorMessage = "".obs;
  var errorUsername = "".obs;
  var errorPassword = ''.obs;
  var confirmPasswordCheck = ''.obs;
  var  isValid = false.obs;
  var errorPhone = "".obs;

  @override
  void onInit() {


    super.onInit();
    passwordVisible.value = true;
    confirmPasswordVisible.value =true;
  }

  validateEmail(String val) {

    if(val.isEmpty || val==null){
      errorMessage.value = error_empty_email;
      isValid.value =false;
    }else if(!EmailValidator.validate(val, true)){
      errorMessage.value = error_invalid_email;
      isValid.value = false;
    }else{
      errorMessage.value = "";
      isValid.value = true;
    }

    return isValid.value;
  }
  validateUserName(String value){
    if(value.isEmpty || value==null){
      errorUsername.value = error_user_name;
      isValid.value =false;
    }
    else{errorUsername.value = "";
    isValid.value =true;
    }
    return isValid.value;
  }
  validatePhoneNo(String value){
    if(value.isEmpty || value.length<=9){
      errorPhone.value = error_phone_no;
      isValid.value = false;
    }
    else {
      errorPhone.value ='';
      isValid.value = true;
    }
    return isValid.value;
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

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
  confirmPassword(String value){
    if(value.isNotEmpty && value == passwordInputController.text){
      confirmPasswordCheck.value = '';
      isValid.value =true;
    }else {confirmPasswordCheck.value = error_confirm_password;
    isValid.value = false;}
    return isValid.value;
  }

  addSignUpDetails() {

    Users signupDetails = Users();
    signupDetails.email = emailInputController.text;
    signupDetails.name = usernameInputController.text;
    signupDetails.password = CommonUtils().encryptPassword(confirmPasswordInputController.text);
    signupDetails.phone = phoneInputController.text ;
    return DailyNotesDatabase.saveUser(signupDetails);
  }
  visible(){
    passwordVisible.value  = !passwordVisible.value;
  }
  confirm(){
    confirmPasswordVisible.value  = !confirmPasswordVisible.value;
  }

  signUpValidation() {
    if (validateEmail(emailInputController.text)&& validateUserName(usernameInputController.text)&&
        validatePassword(passwordInputController.text)&&confirmPassword(confirmPasswordInputController.text)
    &&
     validatePhoneNo(phoneInputController.text))
    {
      signUpUserLocal();
    }
    else {  if (!validateEmail(emailInputController.text)){}
    if(!validateUserName(usernameInputController.text)){}
    if(!validatePassword(passwordInputController.text)){}
    if (!confirmPassword(confirmPasswordInputController.text)){}
       if (!validatePhoneNo(phoneInputController.text)){} }
  }
  signUpUserLocal() {
    addSignUpDetails();
    Get.dialog(
      DialogBox(title: success_alert,
          middleText: details_saved,
          errorType: false,
          onConfirm: () => Get.close(2),
          onCancel: ()=> Get.back(),
          cancelBtn: false),
      barrierDismissible: false
    );
    /*Get.defaultDialog(
        title: error_alert,
        middleText: details_saved,
        actions: [
          TextButton(
              child:  Text(btn_lbl_ok),
              onPressed: () {
                Get.close(2);
              }
          )
        ],
        barrierDismissible: false);*/
  }

}