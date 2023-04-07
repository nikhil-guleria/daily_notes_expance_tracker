import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/Strings.dart';
import '../../utils/SizeConfig.dart';

class ProfileSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Image.asset('assets/images/default_background.png',
        width: Get.width,height: Get.height,fit: BoxFit.cover,),
        Scaffold(resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar( automaticallyImplyLeading: false,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title:
            Text(settings_profile_lbl,
              style: TextStyle(color: Colors.black,
                  fontSize: SizeConfig.blocksize_vertical*4
              )),
        leading: IconButton(onPressed: (){Get.back();},
          icon: Icon(Icons.arrow_back,color: Colors.black))),

        body: Container(height: Get.height,width: Get.width,
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(profile_name,  style: TextStyle(color: Colors.black54,
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
                height: SizeConfig.blocksize_vertical * 3.5,
              ),
              Text(profile_phone_no,  style: TextStyle(color: Colors.black54,
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
                height: SizeConfig.blocksize_vertical * 3.5,
              ),
              Text(profile_email,  style: TextStyle(color: Colors.black54,
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


            ],
          ),


        ),
      ),
    ]);
  }
}