import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:scoref_manager/core/routers/app_routers.dart';
import 'package:scoref_manager/core/routers/routers.dart';
import 'package:scoref_manager/core/ui/theme/app_theme.dart';
// import 'package:scoref_manager/widgets/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const HomePage(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.i.initial,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      routes: Routers.mapRoutes,
      themeMode: ThemeMode.system,
    );
  }
}