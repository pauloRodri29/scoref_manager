import 'package:get/get.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/volleyball_score_controller.dart';

class VolleyballScoreBinding implements Bindings {
  @override
  void dependencies() {
    // lazyPut carrega o controller apenas quando ele for usado pela primeira vez
    Get.lazyPut<VolleyballScoreController>(
      () => VolleyballScoreController(),
      fenix: true,
    );
  }
}
