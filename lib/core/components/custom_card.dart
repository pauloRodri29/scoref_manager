import 'package:flutter/material.dart';

class CustomCardScoreVolleyballWidget extends StatelessWidget {
  final String score;
  final Color color;
  const CustomCardScoreVolleyballWidget({
    super.key,
    required this.score,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // constraints: BoxConstraints(maxHeight: double.infinity,maxWidth: double.infinity),
        // width: MediaQuery.sizeOf(context).width,
        // height: MediaQuery.sizeOf(context).height,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        color: color,
        child: Center(
          child: Text(score, style: Theme.of(context).textTheme.displayLarge),
        ),
      ),
    );
  }
}
