import 'package:daily_notes/routes/app_routes.dart';
import 'package:daily_notes/utils/StorageConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute:getInitialRoutes(),
      getPages: AppPages.routes,
      themeMode: ThemeMode.system,
    );
  }
 getInitialRoutes(){
    String initialRoute = AppPages.INITIAL_ROUTES;
    var storage = GetStorage();
    var email = storage.read(StorageConstant.USER_EMAIL);
    if (email != null){
      initialRoute = AppPages.INITIAL_DASHBOARD;
    }
    return initialRoute;
 }
}