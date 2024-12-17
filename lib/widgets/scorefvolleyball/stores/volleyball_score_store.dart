import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'volleyball_score_store.g.dart';

class VolleyballScoreStore = _VolleyballScoreStoreBase
    with _$VolleyballScoreStore;

abstract class _VolleyballScoreStoreBase with Store {
  // @observable
  // Future<bool> canVibrate = Vibrate.canVibrate;

  // @computed
  // Future<bool> get isCanVibrate => canVibrate;

  // @observable
  // bool vibrateDevice = false;

  // @computed
  // bool get isVibrateDevice => vibrateDevice;

// Name do time 1
  @observable
  String nameTeam1 = "Time 1";

  @computed
  String get isNameTeam1 => nameTeam1;
// Name do time 2
  @observable
  String nameTeam2 = "Time 2";

  @computed
  String get isNameTeam2 => nameTeam2;
// Definição de cor do card do time 1
  @observable
  Color colorTeam1 = Colors.redAccent;

  @computed
  Color get isColorTeam1 => colorTeam1;

// Definição de cor do card do time 2
  @observable
  Color colorTeam2 = Colors.blueAccent;

  @computed
  Color get isColorTeam2 => colorTeam2;

// Pontuação do time 1
  @observable
  int scoreTeam1 = 0;

  @computed
  int get isScoreTeam1 => scoreTeam1;

// Pontuação do time 2
  @observable
  int scoreTeam2 = 0;

  @computed
  int get isScoreTeam2 => scoreTeam2;

  @observable
  int victoryTeam1 = 0;

  @computed
  int get isVictoryTeam1 => victoryTeam1;

  @observable
  int victoryTeam2 = 0;

  @computed
  int get isVictoryTeam2 => victoryTeam2;

  @observable
  int fullScore = 12;

  @computed
  int get isFullScore => fullScore;

// Funções de alterações
  @action
  incrementPointTeam1() {
    if (fullScore != scoreTeam1) {
      scoreTeam1++;
    } else if (fullScore == scoreTeam1) {
      victoryTeam1++;
    }
  }

  @action
  decrementPointTeam1() {
    if (scoreTeam1 > 0) {
      scoreTeam1--;
    }
  }

  @action
  incrementPointTeam2() {
    if (fullScore != scoreTeam2) {
      scoreTeam2++;
    } //else if (fullScore == scoreTeam2) {
    // victoryTeam2++;
    // }
  }

  @action
  decrementPointTeam2() {
    if (scoreTeam2 > 0) {
      scoreTeam2--;
    }
  }

  @action
  void resetPoint() {
    scoreTeam1 = 0;
    scoreTeam2 = 0;
    victoryTeam1 = 0;
    victoryTeam2 = 0;
  }
}
