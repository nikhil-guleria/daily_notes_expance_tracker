import 'dart:io';

import 'package:daily_notes/utils/StorageConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../localdb/DailyNotesDatabase.dart';
import '../../models/UsersData.dart';

class ProfileSettingsController extends GetxController{
   TextEditingController nameInputController = TextEditingController();
   TextEditingController phoneInputController = TextEditingController();
   TextEditingController emailInputController = TextEditingController();
  var imgFile = File("").obs;
    Users userData  = Users();


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


  }