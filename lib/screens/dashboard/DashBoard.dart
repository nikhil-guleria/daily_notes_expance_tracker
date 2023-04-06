import 'package:daily_notes/utils/DialogBox.dart';
import 'package:daily_notes/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget{
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
         )))

     ],
   );

  }

}