import 'package:daily_notes/constants/Strings.dart';
import 'package:daily_notes/models/UserActivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../localdb/DailyNotesDatabase.dart';
import '../../utils/DialogBox.dart';
import '../../utils/StorageConstant.dart';

class ActivityController extends GetxController {
  TextEditingController activityInputController = TextEditingController();
  TextEditingController noteInputController = TextEditingController();
  var  isValid = false.obs;
  var emptyError = ''.obs;


  currentDate(){
    DateTime date = DateTime.now();
   var suffix = 'th';
   var digit = date.day % 10 ;
   if ((digit > 0 && digit < 4 ) && (date.day < 11 || date.day > 13)){
     suffix = ['st','nd','rd'] [digit - 1];
   }
   return DateFormat("dd '$suffix'-MMMM-yyyy").format(date);
  }
  emptyValidator(String value){
    if (value.isNotEmpty){
      emptyError.value = "";
      isValid.value = true;
    }
    else {emptyError.value ='Cannot be Empty';
    isValid.value = false;}
    return isValid.value;
  }
  currentDateTime(){
    DateTime date = DateTime.now();
    return DateFormat("dd-MMMM-yyyy").format(date);
  }

  saveNotes(){
    Activity activity = Activity();
    var storage = GetStorage();
    activity.email = storage.read(StorageConstant.USER_EMAIL);
    activity.activity = activityInputController.text;
    activity.note = noteInputController.text;
    activity.date = currentDateTime();
    return DailyNotesDatabase.saveActivity(activity);
  }
  saveValidation() {
    if(
    emptyValidator(activityInputController.text) && emptyValidator(noteInputController.text))
    {
      saveNotes();
      Get.dialog(DialogBox(title: 'Activity',
          middleText: 'Your activity saved successfully',
          onConfirm: (){clearText();},
          onCancel: (){Get.back();},
          cancelBtn: false,
          icon: Icons.check_circle,
          iconColor: Colors.yellow),
          barrierDismissible: false);
    }
    else {
      if(!emptyValidator(activityInputController.text)){}
      if (!emptyValidator(noteInputController.text)){}
    }}
  void clearText() {
    activityInputController.clear();
    noteInputController.clear();
    Get.back();
  }
}