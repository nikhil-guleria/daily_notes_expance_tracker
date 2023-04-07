import 'package:daily_notes/screens/loginpage/LoginPageController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/Colors.dart';
import '../../constants/Strings.dart';
import '../../routes/app_pages.dart';
import '../../utils/SizeConfig.dart';

class LoginPage extends StatelessWidget{
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
return Stack(
  children: [
    Image.asset('assets/images/login_background.png',
      width: Get.width, height: Get.height,fit: BoxFit.cover,),
    Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body:
      WillPopScope(
        onWillPop: (){
          return loginController.onWillPop(context);},
        child: Container(
          height: Get.height,width: Get.width,

          padding: EdgeInsets.only(top: SizeConfig.blocksize_vertical*6,
              bottom: MediaQuery.of(context).viewInsets.bottom + SizeConfig.blocksize_vertical*5,
              left: SizeConfig.blocksize_horizontal*5,
              right: SizeConfig.blocksize_horizontal*5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                    height: SizeConfig.blocksize_vertical*6
                ),
                Text(lbl_welcome_back,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: SizeConfig.blocksize_vertical*4.2),),
                Text(lbl_username_password,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600, fontSize: SizeConfig.blocksize_vertical*2.4,color: lbl_color)),
                SizedBox(
                    height: SizeConfig.blocksize_vertical*20
                ),
                Text(
                  lbl_username,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400, fontSize:  SizeConfig.blocksize_vertical*3.3,color:lbl_color),
                ),
                TextFormField(cursorColor: Colors.black,
                    controller: loginController.emailInputController,
                    textInputAction: TextInputAction.next,
                    decoration:  InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),)
                ),
                SizedBox(
                    height: SizeConfig.blocksize_vertical*8
                ),
                Text(
                  lbl_password,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400, fontSize: SizeConfig.blocksize_vertical*3.3,color:lbl_color),
                ),
                TextFormField(cursorColor: Colors.black,
                 controller: loginController.passwordInputController,
                  decoration:  InputDecoration(focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)) ),),
                SizedBox(
                    height: SizeConfig.blocksize_vertical*8
                ),
                Center(
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ), backgroundColor:Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),/*maximumSize: Size(300,50)*/
                  ),
                    onPressed: () {
                    loginController.loginValidation();

                    },
                    child: Text(login,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blocksize_vertical*4.2,
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(
                    height: SizeConfig.blocksize_vertical*2
                ),
                Center(
                  child: InkWell(onTap: (){
                  },
                      child: Text(
                        lbl_forgotten_password,
                        style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blocksize_vertical*2),
                      )),
                ),
                SizedBox(
                    height: SizeConfig.blocksize_vertical*0.5
                ),
                Center(
                  child: InkWell(onTap: (){
                    Get.toNamed(Routes.SIGNUPPAGE);
                  },
                    child: Text(lbl_create_new_account,
                        style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blocksize_vertical*2)),
                  ),
                )

              ],
            ),

          ),

        ),
      ))


  ],
);
  }


}