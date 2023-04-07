
import 'package:daily_notes/screens/activity/ActivityController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/Strings.dart';
import '../../utils/SizeConfig.dart';

class Activity extends StatelessWidget {
  ActivityController activityController = Get.put(ActivityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,

      appBar: AppBar(
          automaticallyImplyLeading: false,
           systemOverlayStyle: SystemUiOverlayStyle(
             statusBarColor: Colors.transparent,
             statusBarIconBrightness: Brightness.dark),
    elevation: 0.0,
           backgroundColor: Colors.transparent,
           centerTitle: true,
           title: Text(lbl_activity,
             style: TextStyle(color: Colors.black,
               fontSize: SizeConfig.blocksize_vertical*4
           ),
         )),
      body: Container(height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(top: SizeConfig.blocksize_vertical*2,
            bottom: MediaQuery.of(context).viewInsets.bottom + SizeConfig.blocksize_vertical*2,
            left: SizeConfig.blocksize_horizontal*3,
            right: SizeConfig.blocksize_horizontal*3),

        child: SingleChildScrollView(
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
           // mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              RichText(
                  text: TextSpan(
              text: activity_date,
              style: TextStyle(color: Colors.blue,
                  fontSize: SizeConfig.blocksize_vertical*3.5),
              children: [
                TextSpan(
                  text: '${activityController.currentDate()}',
                  style: TextStyle(color: Colors.grey,fontSize: SizeConfig.blocksize_vertical*2.8)
                )])),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 5,
              ),
              Text(activity_today,style: TextStyle(color: Colors.blue,
                  fontSize: SizeConfig.blocksize_vertical*3.5)),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 2,
              ),
              Container(width: Get.width,height: SizeConfig.blocksize_vertical*30,
                padding: const EdgeInsets.all(3.0),
                /*decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: new BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey)
                ),*/
                child: TextField( cursorColor: Colors.black,
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),)
                )),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 6,
              ),
              Text(activity_note,style: TextStyle(color: Colors.blue,
                  fontSize: SizeConfig.blocksize_vertical*3.5)),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 2,
              ),
              TextField( cursorColor: Colors.black,
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
                height: SizeConfig.blocksize_vertical * 3,
              ),
              Row( mainAxisAlignment: MainAxisAlignment.end,
                children: [ElevatedButton(
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
                },
                child: Text(save,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blocksize_vertical * 2,
                      color: Colors.white,
                    )),
              ),],)


            ],
          ),
        ),
      )
    );
  }
}