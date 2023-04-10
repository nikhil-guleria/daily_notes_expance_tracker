import 'package:daily_notes/screens/settings/SettingsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/Strings.dart';
import '../../routes/app_pages.dart';
import '../../utils/SizeConfig.dart';

class Settings extends StatelessWidget {
  SettingsController settingsController = Get.put(SettingsController());
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
         /* centerTitle: true,
          title: Text(lbl_settings,
            style: TextStyle(color: Colors.black,
              fontSize: SizeConfig.blocksize_vertical*4
          ),
          )*/),
      body: Container(height: Get.height,width: Get.width,
        padding: EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(//mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(settings_title,  style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.blocksize_vertical*4
              ),),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 1,),
              Text(settings_desc,
                  style: TextStyle(color: Colors.grey,fontSize: SizeConfig.blocksize_vertical*2.3)),
              SizedBox(
                height: SizeConfig.blocksize_vertical * 4,),
              ListTile(onTap: (){Get.toNamed(Routes.PROFILESETTINGS);},
                contentPadding: EdgeInsets.only(left: 5),
                minLeadingWidth: SizeConfig.blocksize_horizontal*0.5,
                        leading: const Icon(Icons.account_circle_rounded,color: Colors.black,),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                        title: Text(settings_profile_lbl, style: TextStyle(color: Colors.black,
                            fontSize: SizeConfig.blocksize_vertical*3)),
                subtitle: Text(settings_profile_desc,
                    style: TextStyle(color: Colors.grey,fontSize: SizeConfig.blocksize_vertical*2)),
              ),
              Container(
                decoration: BoxDecoration(border: Border(top:BorderSide(width: 0.1) )),
                child: ListTile(
                    contentPadding: EdgeInsets.only(left: 5),
                    minLeadingWidth: SizeConfig.blocksize_horizontal*0.5,
                    leading: const Icon(Icons.backup,color: Colors.black,),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                    title: Text(settings_backup_lbl,style: TextStyle(color: Colors.black,
                        fontSize: SizeConfig.blocksize_vertical*3)),
                    subtitle: Text(settings_backup_desc,
                        style: TextStyle(color: Colors.grey,fontSize: SizeConfig.blocksize_vertical*2))),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(top:BorderSide(width: 0.1) )),
                child: ListTile( onTap: (){Get.toNamed(Routes.CHANGEPASSWORD);},
                    contentPadding: EdgeInsets.only(left: 5),
                    minLeadingWidth: SizeConfig.blocksize_horizontal*0.5,
                    leading: const Icon(Icons.password,color: Colors.black,),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                    title: Text(settings_change_password,style: TextStyle(color: Colors.black,
                        fontSize: SizeConfig.blocksize_vertical*3)),
                    subtitle: Text(settings_password_desc,
                        style: TextStyle(color: Colors.grey,fontSize: SizeConfig.blocksize_vertical*2))),
              ),
              Container(
                decoration: BoxDecoration(border: Border(top:BorderSide(width: 0.1) )),
                child: ListTile( contentPadding: EdgeInsets.only(left: 5),
                    minLeadingWidth: SizeConfig.blocksize_horizontal*0.5,
                    leading: const Icon(Icons.delete,color: Colors.black,),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                    title: Text(settings_delete_account,style: TextStyle(color: Colors.black,
                        fontSize: SizeConfig.blocksize_vertical*3)),
                    subtitle: Text(settings_delete_desc,
                        style: TextStyle(color: Colors.grey,fontSize: SizeConfig.blocksize_vertical*2))),
              ),
              Container(decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.1),top:BorderSide(width: 0.1) )),
                child: ListTile( contentPadding: EdgeInsets.only(left: 5),
                    minLeadingWidth: SizeConfig.blocksize_horizontal*0.5,
                    leading: const Icon(Icons.logout,color: Colors.black,),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,),
                    title: Text(settings_logout,style: TextStyle(color: Colors.black,
                        fontSize: SizeConfig.blocksize_vertical*3)),
                    subtitle: Text(settings_logout_desc,
                        style: TextStyle(color: Colors.grey,fontSize: SizeConfig.blocksize_vertical*2)),
               onTap: (){settingsController.logOut();}),

              ),


            ],
          ),
        ),


      ),
    );
  }
}