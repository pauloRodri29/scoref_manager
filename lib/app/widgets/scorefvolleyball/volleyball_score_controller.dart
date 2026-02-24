import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/models/settings_manager.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/models/player_volleyball.dart';

class VolleyballScoreController extends GetxController {
  Rx<SettingsManager> settingsManager = SettingsManager(fullPoints: 15).obs;
  RxInt selectSession = 0.obs;

  Rx<PlayerVolleyball> player1 =
      PlayerVolleyball(name: 'Time 1', color: AppColors.scoreCrimson).obs;
  Rx<PlayerVolleyball> player2 =
      PlayerVolleyball(name: 'Time 2', color: AppColors.scoreRoyalBlue).obs;

  RxBool showButton = true.obs;
  RxBool limitPoints = false.obs;

  List<Color> colors = [
    AppColors.scoreAmber,
    AppColors.scoreCharcoal,
    AppColors.scoreCrimson,
    AppColors.scoreEmerald,
    AppColors.scoreIndigo,
    AppColors.scoreLime,
    AppColors.scoreMagenta,
    AppColors.scoreNavy,
    AppColors.scoreOrangeDeep,
    AppColors.scorePurpleDeep,
    AppColors.scoreRoyalBlue,
    AppColors.scoreSky,
    AppColors.scoreSteel,
    AppColors.scoreTeal,
    AppColors.scoreWine,
  ];

  /// Configurações da partida
  void changeShowButton() {
    showButton.value = !showButton.value;
    log(showButton.value.toString());
    update();
  }

  void changeShowButtonWithValue(bool value) {
    showButton.value = value;
    log(showButton.value.toString());
    update();
  }

  void changeSettings(int fullPoints) {
    settingsManager.value.fullPoints = fullPoints;

    // Verifica apenas quem ultrapassou o novo limite
    if (player1.value.points > fullPoints) {
      resetPoints(player: player1.value);
    }

    if (player2.value.points > fullPoints) {
      resetPoints(player: player2.value);
    }

    update();
  }

  void changeNamePlayer({
    required String name,
    required PlayerVolleyball player,
  }) {
    if (player.name == player1.value.name) {
      player1.value.name = name;
    } else {
      player2.value.name = name;
    }
    update();
  }

  void changeColorsPlayer({
    required Color color,
    required PlayerVolleyball player,
  }) {
    if (player.name == player1.value.name) {
      player1.value.color = color;
    } else {
      player2.value.color = color;
    }
    update();
  }

  void changeRuleFullPoints(bool value) {
    limitPoints.value = value;
    update();
  }

  /// Métodos para controlar a partida
  void increment(String player) async {
    final target = player == player1.value.name ? player1 : player2;

    if (limitPoints.value) {
      if (target.value.points >= settingsManager.value.fullPoints) {
        reactionpoints();
        return;
      }
    }

    target.value.points++;

    if (limitPoints.value) {
      if (target.value.points >= settingsManager.value.fullPoints) {
        reactionpoints();
      }
    }

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

  void resetPoints({PlayerVolleyball? player}) {
    if (player != null) {
      if (player.name == player1.value.name) {
        player1.value.points = 0;
      } else {
        player2.value.points = 0;
      }
    } else {
      player1.value.points = 0;
      player2.value.points = 0;
    }

    update();
  }

  void resetVitory() {
    player1.value.victory = 0;
    player2.value.victory = 0;
    update();
  }

  /// Metodos de reacao que disparam som e vibracao
  void reactionpoints() {
    playSound();
    vibrate();
  }

  void vibrate() async {
    // if (await Vibration.hasVibrator() ?? false) {
    //   Vibration.vibrate(duration: 200);
    // }
  }

  void playSound() {
    // final p = AudioPlayer();
    // p.play(AssetSource('audio/alert_metal.mp3'));
  }

  // void playSound() {
  //   player.play(AssetSource('audio/alert_metal.mp3'));
  // }
}
