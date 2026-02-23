import 'package:get/get.dart';
import 'package:scoref_manager/app/widgets/home/home_controller.dart';
import 'package:scoref_manager/app/widgets/scorefchess/chess_score_controller.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/volleyball_score_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // lazyPut carrega o controller apenas quando ele for usado pela primeira vez
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<VolleyballScoreController>(
      () => VolleyballScoreController(),
      fenix: true,
    );
    Get.lazyPut<ChessScoreController>(
      () => ChessScoreController(),
      fenix: true,
    );
  }
}
