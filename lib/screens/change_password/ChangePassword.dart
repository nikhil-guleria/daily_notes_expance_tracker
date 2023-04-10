import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/Strings.dart';
import '../../utils/SizeConfig.dart';

class ChangePassword extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Image.asset(
        'assets/images/default_background.png',
        width: Get.width,
        height: Get.height,
        fit: BoxFit.cover,
      ),
    Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: Colors.transparent,
    appBar: AppBar(
    automaticallyImplyLeading: false,
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    title: Text(change_password_title,
    style: TextStyle(
    color: Colors.black,
    fontSize: SizeConfig.blocksize_vertical * 4)),
    leading: IconButton(
    onPressed: () {
    Get.back();
    },
    icon: Icon(Icons.arrow_back, color: Colors.black))),
    body: Container(
    height: Get.height,
    width: Get.width,
    padding: EdgeInsets.only(
    top: SizeConfig.blocksize_vertical * 2.2,
    bottom: MediaQuery.of(context).viewInsets.bottom +
    SizeConfig.blocksize_vertical * 2.2,
    left: SizeConfig.blocksize_horizontal * 5,
    right: SizeConfig.blocksize_horizontal * 5),
    child:
        SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(old_password,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blocksize_vertical * 3.5)),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 2,
              ),
              TextField(
               // controller: ,
                cursorColor: Colors.black,
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
              Text(new_password,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blocksize_vertical * 3.5)),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 2,
              ),
              TextField(
                // controller: ,
                cursorColor: Colors.black,
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
              Text(confirm_password,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blocksize_vertical * 3.5)),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 2,
              ),
              TextField(
                // controller: ,
                cursorColor: Colors.black,
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
        )

    )
    )],
    );
  }

}