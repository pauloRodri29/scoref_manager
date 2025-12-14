import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/models/settings_manager.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/models/player_volleyball.dart';
import 'package:vibration/vibration.dart';

class VolleyballScoreController extends GetxController {
  Rx<SettingsManager> settingsManager = SettingsManager(fullPoints: 15).obs;
  // final player = AudioPlayer();
  Rx<PlayerVolleyball> player1 =
      PlayerVolleyball(name: 'Player 1', color: AppColors.backgroundRed).obs;
  Rx<PlayerVolleyball> player2 =
      PlayerVolleyball(name: 'Player 2', color: AppColors.backgroundBlue).obs;

  void changeFullPoints(int fullPoints) {
    settingsManager.value = SettingsManager(fullPoints: fullPoints);
    resetPoints();
    update();
  }

  void increment(String player) async {
    final target = player == player1.value.name ? player1 : player2;

    if (target.value.points >= settingsManager.value.fullPoints) {
      reactionpoints();
      return;
    }
    target.value.points++;

    if (target.value.points >= settingsManager.value.fullPoints) {
      reactionpoints();
    }

    // if (player == player1.value.name) {
    //   if (player1.value.points >= settingsManager.value.fullPoints) {
    //     reactionpoints();
    //     return;
    //   }
    //   player1.value.points++;
    //   if (player1.value.points >= settingsManager.value.fullPoints) {
    //     reactionpoints();
    //   }
    // } else if (player == player2.value.name) {
    //   if (player2.value.points >= settingsManager.value.fullPoints) {
    //     reactionpoints();
    //     return;
    //   }
    //   player2.value.points++;
    //   if (player2.value.points >= settingsManager.value.fullPoints) {
    //     reactionpoints();
    //   }
    // }
    update();
  }

  void decrement(String player) {
    if (player == player1.value.name) {
      if (player1.value.points <= 0) {
        vibrate();
        return;
      }
      player1.value.points--;
    } else if (player == player2.value.name) {
      if (player2.value.points <= 0) {
        vibrate();
        return;
      }
      player2.value.points--;
    }
    update();
  }

  void reactionpoints() {
    playSound();
    vibrate();
  }

  void resetPoints() {
    player1.value.points = 0;
    player2.value.points = 0;
    update();
  }

  void resetVitory() {
    player1.value.victory = 0;
    player2.value.victory = 0;
    update();
  }

  void vibrate() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 200);
    }
  }

  void playSound() {
    final p = AudioPlayer();
    p.play(AssetSource('audio/alert_metal.mp3'));
  }

  // void playSound() {
  //   player.play(AssetSource('audio/alert_metal.mp3'));
  // }

  void changeSettings(int fullPoints) {
    settingsManager.value = SettingsManager(fullPoints: fullPoints);
    resetPoints();
    update();
  }
}
