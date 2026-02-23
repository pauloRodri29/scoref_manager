import 'package:get/get.dart';
import 'package:scoref_manager/app/widgets/scorefchess/chess_score_controller.dart';

class ChessScoreBinding implements Bindings {
  @override
  void dependencies() {
    // lazyPut carrega o controller apenas quando ele for usado pela primeira vez
    Get.lazyPut<ChessScoreController>(() => ChessScoreController());
  }
}
