import 'package:daily_notes/constants/Strings.dart';
import 'package:daily_notes/models/UserActivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../localdb/DailyNotesDatabase.dart';
import '../../utils/StorageConstant.dart';

class TransactionController extends GetxController {
   Activity userData = Activity();
    // late List<Map<String, dynamic>> user ;
  TextEditingController nameInputController = TextEditingController();
  TextEditingController phoneInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getDetails();
  }

   DataTable createDataTable(){
    return DataTable(columns: _createColumns(),
     rows: _createRows());
     }
   List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('email')),
      DataColumn(label: Text('activity')),
      DataColumn(label: Text('note')),
      DataColumn(label: Text('date')),
    ];
  }
  List<DataRow> _createRows() {
    return
      [
        DataRow(cells: [
          DataCell(Text('${userData.email}')),
          DataCell(Text('${userData.activity}')),
          DataCell(Text('${userData.note}')),
          DataCell(Text('${userData.date}'))
        ])
      ];
    /*return user.map((data) =>
       DataRow(cells: [
      DataCell(Text(data['email'])),
      DataCell(Text(data['activity'])),
      DataCell(Text(data['note'])),
    DataCell(Text(data['date']))
    ])).toList();*/

  }


  getDetails() async {
    var storage = GetStorage();
    List<Activity> users = <Activity>[];
     List<Map<String, dynamic>> user = await DailyNotesDatabase
        .getActivity(
        storage.read(StorageConstant.USER_EMAIL));
    users.assignAll(user.map((data) => Activity.fromMap(data)).toList());
    userData = users[0];
    nameInputController.text = userData.note!;
    phoneInputController.text = userData.activity!;
    emailInputController.text = userData.date!;
  }

  currentDate() {
    DateTime date = DateTime.now();
    var suffix = 'th';
    var digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = ['st', 'nd', 'rd'] [digit - 1];
    }
    return DateFormat("dd '$suffix'-MMMM-yyyy").format(date);
  }

}