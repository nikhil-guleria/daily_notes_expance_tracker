import 'package:daily_notes/screens/activity/Activity.dart';
import 'package:daily_notes/screens/transaction/TransactionController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
            right:SizeConfig.blocksize_horizontal*3),
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
              Row(
                children: [
                  Text(transaction_earnings,style: TextStyle(color: Colors.blue,
                      fontSize: SizeConfig.blocksize_vertical*3.5)),
                  SizedBox(width: SizeConfig.blocksize_horizontal*14,
                    height: SizeConfig.blocksize_vertical*3,
                    child: ElevatedButton(
                      onPressed: (){}, child: Text(add),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      foregroundColor: Colors.blue,
                     side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                     // minimumSize: Size(0, 0)
                      padding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0), /*maximumSize: Size(300,50)*/



                    ),),
                  )
                ],
              ),
              SizedBox(
                  height: SizeConfig.blocksize_vertical * 1.2
              ),
              Table(
                textDirection: TextDirection.ltr,
                  border:TableBorder.all(width: 1.0,color: Colors.black),
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(3),
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(2),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                      children: [
                        Center(
                          child: Text("Sr.\nNo.",
                            textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Center(child: Text("Source",textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.bold))),
                        Center(child: Text("Ammount",textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.bold))),
                        Center(child: Text("Date \nTime",textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.bold))),
                        Center(child: Text("Action",textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.bold))),
                      ]
                  ),
                  TableRow(
                      children: [
                        TextField( cursorColor: Colors.black,decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                          ))),
                        TextField(controller: transactionController.nameInputController,
                            cursorColor: Colors.black,decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ))),
                        TextField(controller: transactionController.phoneInputController,
                            cursorColor: Colors.black,decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ))),
                        TextField(controller: transactionController.emailInputController,
                            cursorColor: Colors.black,decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ))),
                        TextButton(onPressed: (){

                        }, child: Text('save'))
                      ]
                  ),
                ],

              ),
              ListView(scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  transactionController.createDataTable()
                ],
              ),




            ])

        ),
      ),
    );
  }
}