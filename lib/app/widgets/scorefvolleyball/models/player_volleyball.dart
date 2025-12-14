import 'package:scoref_manager/app/core/models/player.dart';

class PlayerVolleyball extends Player {
  int points;

  PlayerVolleyball({
    required super.name,
    super.color,
    super.defeat = 0,
    super.victory = 0,
    this.points = 0,
  });
}
