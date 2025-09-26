import 'package:get/get.dart';
import 'package:scoref_manager/app/core/models/settings_volleyball.dart';

class VolleyballScoreController extends GetxController {
  /// Estado centralizado em um único objeto
  var settings = SettingsVolleyball().obs;

  // ---- SCORE ----
  void incrementScoreA() {
    settings.update((val) {
      val!.scoreTeam1++;
    });
  }

  void decrementScoreA() {
    settings.update((val) {
      if (val!.scoreTeam1 > 0) val.scoreTeam1--;
    });
  }

  void incrementScoreB() {
    settings.update((val) {
      val!.scoreTeam2++;
    });
  }

  void decrementScoreB() {
    settings.update((val) {
      if (val!.scoreTeam2 > 0) val.scoreTeam2--;
    });
  }

  // ---- RESET ----
  void resetScores() {
    settings.update((val) {
      val!.scoreTeam1 = 0;
      val.scoreTeam2 = 0;
    });
  }

  // void resetAll() {
  //   settings.update((val) {
  //     val!
  //       ..scoreTeam1 = 0
  //       ..scoreTeam2 = 0
  //       ..victoryTeam1 = 0
  //       ..victoryTeam2 = 0
  //       ..time = 0;
  //   });
  // }

  // void resetSets() {
  //   settings.update((val) {
  //     val!
  //       ..victoryTeam1 = 0
  //       ..victoryTeam2 = 0;
  //   });
  // }

  // ---- SETS ----
  // void _checkSetWinner() {
  //   final s = settings.value;
  //   if (s.scoreTeam1 >= s.fullPoint && s.scoreTeam1 > s.scoreTeam2) {
  //     settings.update((val) {
  //       val!.victoryTeam1++;
  //       val.scoreTeam1 = 0;
  //       val.scoreTeam2 = 0;
  //     });
  //   }
  //   if (s.scoreTeam2 >= s.fullPoint && s.scoreTeam2 > s.scoreTeam1) {
  //     settings.update((val) {
  //       val!.victoryTeam2++;
  //       val.scoreTeam1 = 0;
  //       val.scoreTeam2 = 0;
  //     });
  //   }
  // }
}
