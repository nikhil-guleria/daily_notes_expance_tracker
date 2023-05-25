import 'package:daily_notes/screens/report/ReportController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/Strings.dart';
import '../../utils/SizeConfig.dart';

class Report extends StatelessWidget {
  ReportController reportController = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar( automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(lbl_report,
            style: TextStyle(color: Colors.black,
              fontSize: SizeConfig.blocksize_vertical*4
          ),
          )),
      body: Center(
        child: Container(
          color: Colors.green,

        ),
      ),
    );
  }
}