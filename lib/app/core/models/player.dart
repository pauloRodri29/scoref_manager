import 'package:flutter/material.dart';

abstract class Player {
  String name;
  Color? color;
  int victory;
  int defeat;

  Player({
    required this.name,
    this.color,
    this.victory = 0,
    this.defeat = 0,
  });
}
