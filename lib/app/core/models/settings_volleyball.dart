// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingsVolleyball {
  String nameTeam1;
  String nameTeam2;
  Color colorTeam1;
  Color colorTeam2;
  int scoreTeam1;
  int scoreTeam2;
  int victoryTeam1;
  int victoryTeam2;
  int time;
  int fullPoint;

  SettingsVolleyball({
    this.nameTeam1 = "Time A",
    this.nameTeam2 = "Time B",
    this.colorTeam1 = Colors.redAccent,
    this.colorTeam2 = Colors.blueAccent,
    this.scoreTeam1 = 10,
    this.scoreTeam2 = 10,
    this.victoryTeam1 = 1,
    this.victoryTeam2 = 2,
    this.time = 0,
    this.fullPoint = 12,
  });

  int incrementScore(int value) => value++;

  int decrementScore(int value) => value--;

  void resetScore() {
    scoreTeam1 = 0;
    scoreTeam2 = 0;
  }
}
