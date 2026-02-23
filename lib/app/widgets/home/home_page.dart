import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
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
              fontSize: ((fontSize * 2).clamp(18, 24)),
            ),
          ),
        ),
        body: Container(
          width: Get.width,
          height: Get.height,
          alignment: Alignment.topCenter,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: MasonryGridView(
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Get.width < 800 ? 2 : 3,
                ),
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routers.VOLLEYBALL);
                      },
                      // Navigator.pushNamed(context, AppRoutes.i.volleyballPage),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "Volei",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: fontSize),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routers.CHESS);
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "Xadrez",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: fontSize),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: GestureDetector(
                  //     onTap: () {},
                  //     child: const Card(
                  //       child: Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 20),
                  //         child: Icon(
                  //           Icons.hourglass_top_outlined,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              )),
        ),
      );
    });
  }
}
