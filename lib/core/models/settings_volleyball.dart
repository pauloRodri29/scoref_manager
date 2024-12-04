import 'package:flutter/material.dart';

class SettingsVolleyball {
  String nameTeam1;
  String nameTeam2;
  Color colorTeam1;
  Color colorTeam2;
  int scoreTeam1;
  int scoreTeam2;
  int time;

  SettingsVolleyball({
    this.nameTeam1 = "Team 1",
    this.nameTeam2 = "Team 2",
    this.scoreTeam2 = 0,
    this.scoreTeam1 = 0,
    this.colorTeam1 = Colors.lime,
    this.colorTeam2 = Colors.lightBlueAccent,
    this.time = 0,
  });

  incrementStoref(int scoref) {
    return scoref++;
  }

  decrementStoref(int scoref) {
    return scoref--;
  }

  resetStoref(int scoref) {
    return 0;
  }
}
