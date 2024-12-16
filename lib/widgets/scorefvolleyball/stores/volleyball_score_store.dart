import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'volleyball_score_store.g.dart';

class VolleyballScoreStore = _VolleyballScoreStoreBase
    with _$VolleyballScoreStore;

abstract class _VolleyballScoreStoreBase with Store {
  @observable
  String nameTeam1 = "Time 1";

  @observable
  String nameTeam2 = "Time 2";

  @observable
  Color colorTeam1 = Colors.redAccent;

  @observable
  Color colorTeam2 = Colors.blueAccent;

  @observable
  int scoreTeam1 = 0;

  @observable
  int scoreTeam2 = 0;

  @observable
  int victoryTeam1 = 0;

  @observable
  int victoryTeam2 = 0;

  @action
  incrementPointTeam1() {
    scoreTeam1++;
  }

  @action
  decrementPointTeam1() {
    if (scoreTeam1 > 0) {
      scoreTeam1--;
    }
  }

  @action
  incrementPointTeam2() {
    scoreTeam2++;
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
  }

  @computed
  int get isScoreTeam1 => scoreTeam1;

  @computed
  int get isScoreTeam2 => scoreTeam2;

  @computed
  int get isVictoryTeam1 => victoryTeam1;

  @computed
  int get isVictoryTeam2 => victoryTeam2;

  @computed
  String get isNameTeam1 => nameTeam1;

  @computed
  String get isNameTeam2 => nameTeam2;

  @computed
  Color get isColorTeam1 => colorTeam1;

  @computed
  Color get isColorTeam2 => colorTeam2;
}
