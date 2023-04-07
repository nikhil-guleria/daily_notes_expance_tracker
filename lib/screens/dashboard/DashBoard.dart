import 'package:daily_notes/screens/dashboard/DashBoardController.dart';
import 'package:daily_notes/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/Colors.dart';
import '../../constants/Strings.dart';
import '../../routes/app_pages.dart';


class DashBoard extends StatelessWidget{
  DashBoardController dashBoardController = Get.put(DashBoardController());


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: [SystemUiOverlay.bottom,SystemUiOverlay.top]);
   return Stack(
     children: [
       Image.asset('assets/images/default_background.png',
       width: Get.width,height: Get.height,fit: BoxFit.cover,),
       Scaffold(
         resizeToAvoidBottomInset: false,
         backgroundColor: Colors.transparent,
           body: Navigator(
             key: Get.nestedKey(1),
             initialRoute: Routes.ACTIVITY,
             onGenerateRoute: dashBoardController.onGenerateRoute,

           ),

    bottomNavigationBar: Obx (() =>
    BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      selectedFontSize: 15,
      selectedIconTheme: IconThemeData(color:unselected_color, size: 20),
      selectedItemColor: unselected_color,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
      unselectedItemColor: unselected_color,
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.local_activity),
    label: lbl_activity,
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.transfer_within_a_station),
    label: lbl_transaction,
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.report),
    label: lbl_report,
    ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: lbl_settings,
      ),
    ],
      currentIndex: dashBoardController.currentIndex.value,
      onTap: dashBoardController.changePage,

    ),
      )

       )

     ],
   );

  }

}