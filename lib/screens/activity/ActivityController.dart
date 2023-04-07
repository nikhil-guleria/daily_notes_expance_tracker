import 'package:daily_notes/constants/Strings.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActivityController extends GetxController {
  currentDate(){
    DateTime date = DateTime.now();
   var suffix = 'th';
   var digit = date.day % 10 ;
   if ((digit > 0 && digit < 4 ) && (date.day < 11 || date.day > 13)){
     suffix = ['st','nd','rd'] [digit - 1];
   }
   return DateFormat("dd '$suffix'-MMMM-yyyy").format(date);
  }
}