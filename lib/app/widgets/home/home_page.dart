import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/components/custom_card_icon.dart';
import 'package:scoref_manager/app/core/routers/app_routers.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';
import 'package:scoref_manager/app/widgets/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final fontSize = (constraints.maxWidth * 0.04).clamp(16.0, 20.0);

      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.surfaceDark,
          centerTitle: false,
          title: Text(
            "Scoref Manager",
            style: TextStyle(
              color: AppColors.textOnPrimaryLight,
              fontSize: ((fontSize * 2).clamp(18, 20)),
            ),
          ),
        ),
        body: Container(
          width: Get.width,
          height: Get.height,
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: MasonryGridView(
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Get.width < 800 ? 2 : 3,
              ),
              children: [
                CustomCardIcon(
                  onTap: () {
                    Get.toNamed(Routers.VOLLEYBALL);
                  },
                  label: "Voleibol",
                  fontSize: fontSize,
                  icon: Icons.sports_volleyball,
                ),
                CustomCardIcon(
                  onTap: () {
                    Get.toNamed(Routers.CHESS);
                  },
                  label: "Xadrez",
                  fontSize: fontSize,
                  icon: Icons.extension,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
