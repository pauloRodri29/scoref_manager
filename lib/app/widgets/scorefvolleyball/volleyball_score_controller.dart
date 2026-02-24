import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/models/settings_manager.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';
import 'package:scoref_manager/app/utils/full_screen_helper.dart';
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
  RxBool isFullscreen = false.obs;
  RxBool markedVictory = false.obs;

  /// Váriavel que dá permissão para marcar vitoria
  bool isMarkedVitory =
      true; // Variavel que controla se o jogador pode marcar vitoria

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

  void changeShowButton(bool? value) {
    if (value == null) {
      showButton.value = !showButton.value;
    } else {
      showButton.value = value;
    }
    update();
  }

  void changeRuleFullPoints(bool value) {
    limitPoints.value = value;
    update();
  }

  void changeRuleMarkedVictory(bool? value) {
    if (value != null) {
      markedVictory.value = value;
    } else {
      markedVictory.value = !markedVictory.value;
    }
    log("Alterando regra de vitoria MarkedVitory: ${markedVictory.value}");
    update();
  }

  void changeControllerMarkedVictory(bool value) {
    isMarkedVitory = value;
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
        reactionpoints(isVitory: true);
        if (markedVictory.value) {
          log("Controlador dando permissão para marcar vitoria");
          markedVictoryPlayer(player);
        }
      }
    }

    update();
  }

  void decrement(String player) {
    if (player == player1.value.name) {
      if (player1.value.points <= 0) {
        reactionpoints();
        vibrate();
        return;
      }
      player1.value.points--;
    } else if (player == player2.value.name) {
      if (player2.value.points <= 0) {
        vibrate();
        reactionpoints();
        return;
      }
      player2.value.points--;
    }
    update();
  }

  void markedVictoryPlayer(String player) {
    log("Marcando vitoria para $player");
    if (isMarkedVitory && markedVictory.value) {
      if (player == player1.value.name) {
        player1.value.victory++;
      } else if (player == player2.value.name) {
        player2.value.victory++;
      }

      changeControllerMarkedVictory(false);
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
    if (markedVictory.value) {
      changeControllerMarkedVictory(true);
    }

    update();
  }

  void resetVitory() {
    player1.value.victory = 0;
    player2.value.victory = 0;
    if (markedVictory.value) {
      changeControllerMarkedVictory(true);
    }

    update();
  }

  /// Metodos de reacao que disparam som e vibracao
  void reactionpoints({bool isVitory = false}) {
    playSound(isVitory);
    vibrate();
  }

  void vibrate() async {
    // if (await Vibration.hasVibrator() ?? false) {
    //   Vibration.vibrate(duration: 200);
    // }
  }

  void playSound(bool isVitory) {
    final p = AudioPlayer();
    if (isVitory) {
      p.play(AssetSource('audio/awaw.mp3'));
    } else {
      p.play(AssetSource('audio/alert_metal.mp3'));
    }
  }

  void verifyFullScreen() async {
    final value = await FullscreenHelper.isFullscreen();
    isFullscreen.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    verifyFullScreen();
  }
}
