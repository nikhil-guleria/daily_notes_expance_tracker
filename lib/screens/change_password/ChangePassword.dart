import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/Colors.dart';
import '../../constants/Strings.dart';
import '../../utils/SizeConfig.dart';
import 'ChangePasswordController.dart';

class ChangePassword extends StatelessWidget{
  ChangePasswordController changePasswordController = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Image.asset(
        'assets/images/default_background.png',
        width: Get.width,
        height: Get.height,
        fit: BoxFit.cover,
      ),
    Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.transparent,
    appBar: AppBar(
    automaticallyImplyLeading: false,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    title: Text(change_password_title,
    style: TextStyle(
    color: Colors.black,
    fontSize: SizeConfig.blocksize_vertical * 4)),
    leading: IconButton(
    onPressed: () {
    Get.back();
    },
    icon: Icon(Icons.arrow_back, color: Colors.black))),
    body: Container(
    height: Get.height,
    width: Get.width,
    padding: EdgeInsets.only(
    top: SizeConfig.blocksize_vertical * 2.2,
    bottom: MediaQuery.of(context).viewInsets.bottom +
    SizeConfig.blocksize_vertical * 2.2,
    left: SizeConfig.blocksize_horizontal * 5,
    right: SizeConfig.blocksize_horizontal * 5),
    child:
        SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.blocksize_vertical * 3,
              ),
              Text(old_password,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blocksize_vertical * 3.5)),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 2,
              ),

              TextField(
                controller: changePasswordController.oldPasswordController,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  changePasswordController.oldPasswordValidate(value);
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
               ),
              Obx(() => Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  '${changePasswordController.oldPassword.value}',
                  style: TextStyle(color: Colors.red),
                ),
              )),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 3.5,
              ),
              Text(new_password,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blocksize_vertical * 3.5)),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 2,
              ),
              Obx(() => TextField(
                controller: changePasswordController.newPasswordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                obscureText: changePasswordController.passwordVisible.value,
                onChanged: (value) {
                  changePasswordController.validatePassword(value);
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
    suffixIcon: IconButton(
    icon: Icon(changePasswordController.passwordVisible.value
    ? Icons.visibility
        : Icons.visibility_off),
    color: lbl_color,
    onPressed: () {
    changePasswordController.visible();
    }),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ) ),
              Obx(() => Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  '${changePasswordController.errorPassword.value}',
                  style: TextStyle(color: Colors.red),
                ),
              )),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 3.5,
              ),
              Text(confirm_password,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blocksize_vertical * 3.5)),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 2,
              ),
              Obx(() =>
              TextField(
                controller:
                changePasswordController.confirmPasswordController,
                obscureText:
                changePasswordController.confirmPasswordVisible.value,
                onChanged: (value) {
                  changePasswordController.confirmPassword(value);
                },
                textInputAction: TextInputAction.done,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(
                          changePasswordController.confirmPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                      color: lbl_color,
                      onPressed: () {
                        changePasswordController.confirm();
                      }),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ) ),
              Obx(() => Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  '${changePasswordController.confirmPasswordCheck.value}',
                  style: TextStyle(color: Colors.red),
                ),
              )),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 5.5,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10), /*maximumSize: Size(300,50)*/
                    ),
                    onPressed: () {
changePasswordController.confirmPasswordValidation();
                    },
                    child: Text(confirm,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blocksize_vertical * 2,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),

            ],
          ),
        )

    )
    )],
    );
  }

}