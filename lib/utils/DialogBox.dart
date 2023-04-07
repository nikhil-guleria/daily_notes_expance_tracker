import 'package:daily_notes/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogBox extends StatelessWidget{
  final title;
  final middleText;
  final errorType;
  final onConfirm;
  final onCancel;
  final cancelBtn;
  DialogBox({ @required this.title, @required this.middleText,
    @required this.errorType,@required this.onConfirm,
    @required this.onCancel,@required this.cancelBtn});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Container(height: SizeConfig.blocksize_vertical*35,
          width: SizeConfig.blocksize_horizontal*80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              errorType == true ?
             Center(child:
             Icon(Icons.error_outline_rounded,color: Colors.red,
                 size: SizeConfig.blocksize_vertical*7)) :
              Center(child:
              Icon(Icons.check,color: Colors.green,
                  size: SizeConfig.blocksize_vertical*7)),
              Text(title , style: GoogleFonts.inter( color: Colors.black,
                  decoration: TextDecoration.none,
                  fontSize: SizeConfig.blocksize_vertical*3.3)),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Text(middleText , style: GoogleFonts.inter( color: Colors.grey,
                    decoration: TextDecoration.none,
                     fontSize: SizeConfig.blocksize_vertical*2.2)),
              ),
              cancelBtn == true ?
              Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: onConfirm, child: Text('Ok',
                    style: TextStyle(fontSize: SizeConfig.blocksize_vertical*3) ,)),
                  TextButton(onPressed: onCancel, child: Text('Cancel',
                    style: TextStyle(fontSize: SizeConfig.blocksize_vertical*3) ,))
                ],
              ):

                  TextButton(onPressed: onConfirm, child: Text('Ok',
                    style: TextStyle(fontSize: SizeConfig.blocksize_vertical*3) ,)),
            ],
          ),
        ),
      ),
    );

  }

}