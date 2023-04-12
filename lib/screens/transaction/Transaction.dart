import 'package:daily_notes/screens/transaction/TransactionController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/Strings.dart';
import '../../utils/SizeConfig.dart';

class Transaction extends StatelessWidget {
  TransactionController transactionController = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar( automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title:
          Text(lbl_transaction,
            style: TextStyle(color: Colors.black,
              fontSize: SizeConfig.blocksize_vertical*4
          ),
          )),
      body: Container(height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(top: SizeConfig.blocksize_vertical*1,
            bottom: MediaQuery.of(context).viewInsets.bottom + SizeConfig.blocksize_vertical*1,
            left: SizeConfig.blocksize_horizontal*3,
            right: SizeConfig.blocksize_horizontal*3),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      text: activity_date,
                      style: TextStyle(color: Colors.blue,
                          fontSize: SizeConfig.blocksize_vertical*3.5),
                      children: [
                        TextSpan(
                            text: '${transactionController.currentDate()}',
                            style: TextStyle(color: Colors.grey,fontSize: SizeConfig.blocksize_vertical*2.8)
                        )])),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 2
              ),
              Text(transaction_earnings,style: TextStyle(color: Colors.blue,
                  fontSize: SizeConfig.blocksize_vertical*3.5)),

            ],
          ),
        ),
      ),
    );
  }
}