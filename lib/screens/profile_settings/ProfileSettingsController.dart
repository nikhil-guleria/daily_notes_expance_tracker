import 'dart:convert';
import 'dart:io';

import 'package:daily_notes/utils/DialogBox.dart';
import 'package:daily_notes/utils/StorageConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/Strings.dart';
import '../../localdb/DailyNotesDatabase.dart';
import '../../models/UsersData.dart';

class ProfileSettingsController extends GetxController{
   TextEditingController nameInputController = TextEditingController();
   TextEditingController phoneInputController = TextEditingController();
   TextEditingController emailInputController = TextEditingController();
  var imgFile = File("").obs;
    Users userData  = Users();
    var imgStr = ''.obs;
    var password = "".obs;


  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  getUserData() async {
    var storage = GetStorage();
    List<Users> users = <Users>[];
    final List<Map<String, dynamic>> user = await DailyNotesDatabase.getUser(
        storage.read(StorageConstant.USER_EMAIL));
    users.assignAll(user.map((data) => Users.fromMap(data)).toList());
    userData = users[0];
    nameInputController.text = userData.name!;
    phoneInputController.text = userData.phone!;
    emailInputController.text = userData.email!;
    password.value= userData.password!;
    imgStr.value = userData.image!;

  }
   getFromGallery() async {
     PickedFile? pickedFile = await ImagePicker().getImage(
       source: ImageSource.gallery
     );
     if (pickedFile != null) {
       File imageFile = File(pickedFile.path);
       imgFile.value = imageFile;
     }
   }
   getFromCamera() async {
     PickedFile? pickedFile = await ImagePicker().getImage(
       source: ImageSource.camera,
     );
     if (pickedFile != null) {
       File imageFile = File(pickedFile.path);
       imgFile.value = imageFile;
     }
   }
   convertFileToStr(File imgFile){
    List<int> imageBytes = imgFile.readAsBytesSync();
    return base64Encode(imageBytes);
   }
   convertStrToFile(String base64String){
    return base64.decode(base64String);
   }
   updateData(){
    Users usersData = Users();
    var storage = GetStorage();
    usersData.email = storage.read(StorageConstant.USER_EMAIL);
    usersData.name = nameInputController.text;
    usersData.phone = phoneInputController.text;
    if (imgFile.value.path.isEmpty){
      usersData.image = imgStr.value;
    }else {
      usersData.image = convertFileToStr(imgFile.value);
    }
    usersData.password = password.value;
    return DailyNotesDatabase.updateUsersDetails(usersData);
   }
updateDetails(){
    updateData();
    Get.dialog(DialogBox(title: update_dialog_title,
        middleText: update_dialog_midd_txt,
        onConfirm: (){
          getUserData();
          Get.back();
        },
        onCancel: (){Get.back();},
        cancelBtn: false,
        icon: Icons.check_circle,
        iconColor: Colors.purple));
}

  }