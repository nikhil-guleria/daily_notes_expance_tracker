import 'package:daily_notes/screens/dashboard/DashBoardController.dart';
import 'package:daily_notes/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/Colors.dart';
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
         appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
             statusBarColor: Colors.transparent,
             statusBarIconBrightness: Brightness.dark),
    elevation: 0.0,
           backgroundColor: Colors.transparent,
           centerTitle: true,
           title: Text('title',style: TextStyle(color: Colors.black,
               fontSize: SizeConfig.blocksize_vertical*4
           ),
         )),
           body: Navigator(
             key: Get.nestedKey(1),
             initialRoute: Routes.ACTIVITY,
             onGenerateRoute: dashBoardController.onGenerateRoute,
           ),

    bottomNavigationBar: Obx (() =>
    BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      selectedFontSize: 20,
      selectedIconTheme: IconThemeData(color:selected_color, size: 40),
      selectedItemColor: selected_color,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedIconTheme: IconThemeData(
        color: unselected_color,
      ),
      unselectedItemColor: unselected_color,
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.local_activity),
    label: 'Activity',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.transfer_within_a_station),
    label: 'Transaction',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.report),
    label: 'Report',
    ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
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