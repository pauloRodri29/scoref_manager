import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/routers/app_routers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.INITIAL,
      // theme: AppTheme.lightTheme(context),
      // darkTheme: AppTheme.darkTheme(context),
      themeMode: ThemeMode.system,
      getPages: AppPages.pages,
    );
  }
}
