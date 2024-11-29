import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:scoref_manager/core/routers/app_routers.dart';
import 'package:scoref_manager/widgets/home/home_page.dart';

void main() {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp( MaterialApp(home: const MyApp(),debugShowCheckedModeBanner: false, initialRoute: AppRoutes.i.initial,),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}