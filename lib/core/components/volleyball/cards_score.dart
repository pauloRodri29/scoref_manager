import 'package:flutter/material.dart';

class CardCustomScoreVolleyball extends StatelessWidget {
  final int scoreTime;
  const CardCustomScoreVolleyball({super.key, required this.scoreTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        scoreTime.toString(),
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
