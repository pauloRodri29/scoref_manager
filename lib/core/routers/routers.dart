import 'package:flutter/material.dart';
import 'package:scoref_manager/core/routers/app_routers.dart';
import 'package:scoref_manager/widgets/home/home_page.dart';

class Routers {
  static Map<String, Widget Function(BuildContext)> mapRoutes =
      <String, WidgetBuilder>{
    AppRoutes.i.initial: (context) =>
        const HomePage(),
  };
}