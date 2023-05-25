import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/Colors.dart';
import '../../constants/Strings.dart';
import '../../utils/SizeConfig.dart';
import 'SignUpPageController.dart';

class SignUpPage extends StatelessWidget {
  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Stack(
      children: [
        Image.asset('assets/images/signup_background.png',
            width: Get.width, height: Get.height, fit: BoxFit.cover),
        Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Image.asset('assets/images/back.png'),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            body: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.only(top: SizeConfig.blocksize_vertical*3,
                  bottom: MediaQuery.of(context).viewInsets.bottom + SizeConfig.blocksize_vertical*5,
                  left: SizeConfig.blocksize_horizontal*5,
                  right: SizeConfig.blocksize_horizontal*5),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      lbl_create_account,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.blocksize_vertical * 4),
                    ),
                    SizedBox(
                      height: SizeConfig.blocksize_vertical * 4,
                    ),
                    Text(lbl_enter_emailid,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blocksize_vertical*3.3,
                            color: lbl_color)),
                    TextFormField(
                        cursorColor: Colors.black,
                        onChanged: (val) {
                          signUpController.validateEmail(val);
                        },
                        controller: signUpController.emailInputController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        )),
                    Obx(
                          () => Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          '${signUpController.errorMessage.value}',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.blocksize_vertical * 2),
                    Text(lbl_enter_username,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blocksize_vertical*3.3,
                            color: lbl_color)),
                    TextFormField(
                        cursorColor: Colors.black,
                        onChanged: (value) {
                          signUpController.validateUserName(value);
                        },
                        controller: signUpController.usernameInputController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        )),
                    Obx(
                          () => Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          '${signUpController.errorUsername.value}',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.blocksize_vertical * 2),
                    Text(lbl_enter_phone_no,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blocksize_vertical*3.3,
                            color: lbl_color)),
                    TextFormField(
                        cursorColor: Colors.black,
                        onChanged: (value) {
                          signUpController.validatePhoneNo(value);
                        },
                        controller: signUpController.phoneInputController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        )),
                    Obx(
                          () => Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          '${signUpController.errorPhone.value}',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),

                    SizedBox(height: SizeConfig.blocksize_vertical * 2),
                    Text(lbl_create_pasword,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blocksize_vertical*3.3,
                            color: lbl_color)),
                    Obx(() => TextFormField(
                        cursorColor: Colors.black,
                        controller: signUpController.passwordInputController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: signUpController.passwordVisible.value,
                        onChanged: (value) {
                          signUpController.validatePassword(value);
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(signUpController.passwordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: lbl_color,
                              onPressed: () {
                                signUpController.visible();
                              }),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ))),
                    Obx(() => Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        '${signUpController.errorPassword.value}',
                        style: TextStyle(color: Colors.red),
                      ),
                    )),
                    SizedBox(height: SizeConfig.blocksize_vertical * 2),
                    Text(lbl_confirm_password,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blocksize_vertical*3.3,
                            color: lbl_color)),
                    Obx(() => TextFormField(
                        cursorColor: Colors.black,
                        controller:
                        signUpController.confirmPasswordInputController,
                        obscureText:
                        signUpController.confirmPasswordVisible.value,
                        onChanged: (value) {
                          signUpController.confirmPassword(value);
                        },
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(
                                  signUpController.confirmPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                              color: lbl_color,
                              onPressed: () {
                                signUpController.confirm();
                              }),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ))),
                    Obx(() => Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        '${signUpController.confirmPasswordCheck.value}',
                        style: TextStyle(color: Colors.red),
                      ),
                    )),
                    SizedBox(height: SizeConfig.blocksize_vertical * 2),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal: 70,
                              vertical: 10), /*maximumSize: Size(300,50)*/
                        ),
                        onPressed: () {
                          signUpController.signUpValidation();
                        },
                        child: Text(sign_up,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blocksize_vertical * 2,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
