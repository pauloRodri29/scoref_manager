import 'package:flutter/material.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';

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
    this.colorTeam1 = AppColors.brandDark,
    this.colorTeam2 = AppColors.crimson,
    this.scoreTeam1 = 0,
    this.scoreTeam2 = 0,
    this.victoryTeam1 = 0,
    this.victoryTeam2 = 0,
    this.time = 0,
    this.fullPoint = 12,
  });
}
