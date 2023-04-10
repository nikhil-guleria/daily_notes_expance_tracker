import 'package:daily_notes/screens/profile_settings/ProfileSettingsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/Strings.dart';
import '../../utils/SizeConfig.dart';

class ProfileSettings extends StatelessWidget {
  ProfileSettingsController profileSettingsController =
      Get.put(ProfileSettingsController());

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
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
            title: Text(settings_profile_lbl,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: SizedBox(
                  height: SizeConfig.blocksize_vertical * 27,
                  width: SizeConfig.blocksize_horizontal * 70,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      Obx(() => profileSettingsController
                              .imgFile.value.path.isEmpty
                          ? profileSettingsController.imgStr.value.isEmpty
                              ? CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/userprofile.png'),
                                )
                              : CircleAvatar(
                                  backgroundImage: MemoryImage(
                                      profileSettingsController
                                          .convertStrToFile(
                                              profileSettingsController
                                                  .imgStr.value)))
                          : CircleAvatar(
                              backgroundImage: FileImage(
                                  profileSettingsController.imgFile.value))),
                      Positioned(
                          bottom: SizeConfig.blocksize_vertical * 1,
                          right: SizeConfig.blocksize_horizontal * 10,
                          child: RawMaterialButton(
                            onPressed: () {
                              Get.dialog(AlertDialog(
                                  title: Text(profile_image_picker_title,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              SizeConfig.blocksize_vertical *
                                                  3)),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () {
                                        profileSettingsController
                                            .getFromGallery();
                                        Get.back();
                                      },
                                      child: Text(image_picker_gallery,
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: SizeConfig
                                                      .blocksize_vertical *
                                                  2.7)),
                                    ),
                                    MaterialButton(
                                        onPressed: () {
                                          profileSettingsController
                                              .getFromCamera();
                                          Get.back();
                                        },
                                        child: Text(image_picker_camera,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: SizeConfig
                                                        .blocksize_vertical *
                                                    2.7))),
                                  ]));
                            },
                            elevation: 2.0,
                            fillColor: Color(0xFFF5F6F9),
                            child: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            padding: EdgeInsets.all(10.0),
                            shape: CircleBorder(),
                          )),
                    ],
                  ),
                )),
                Text(profile_name,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: SizeConfig.blocksize_vertical * 3.5)),
                SizedBox(
                  height: SizeConfig.blocksize_vertical * 2,
                ),
                TextField(
                  controller: profileSettingsController.nameInputController,
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
                SizedBox(
                  height: SizeConfig.blocksize_vertical * 3.5,
                ),
                Text(profile_phone_no,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: SizeConfig.blocksize_vertical * 3.5)),
                SizedBox(
                  height: SizeConfig.blocksize_vertical * 2,
                ),
                TextField(
                  controller: profileSettingsController.phoneInputController,
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
                SizedBox(
                  height: SizeConfig.blocksize_vertical * 3.5,
                ),
                Text(profile_email,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: SizeConfig.blocksize_vertical * 3.5)),
                SizedBox(
                  height: SizeConfig.blocksize_vertical * 2,
                ),
                TextField(
                  controller: profileSettingsController.emailInputController,
                  enableInteractiveSelection: false,
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
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
                SizedBox(
                  height: SizeConfig.blocksize_vertical * 3.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 10), /*maximumSize: Size(300,50)*/
                      ),
                      onPressed: () {
                        profileSettingsController.updateDetails();
                      },
                      child: Text(update,
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
          ),
        ),
      ),
    ]);
  }
}
