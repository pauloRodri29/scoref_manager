import 'package:flutter/material.dart';

class CustomCardScoreVolleyballWidget extends StatelessWidget {
  final String value;
  final Color color;
  final Function()? dragUp;
  final Function()? dragDown;
  const CustomCardScoreVolleyballWidget({
    super.key,
    required this.value,
    required this.color,
    this.dragUp,
    this.dragDown,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        // onVerticalDragStart: (details) {
        //   // print("Entrada Local: ${details.localPosition.dy}");
        //   // print("Entrada Global: ${details.globalPosition.dy}");
        // },
        onVerticalDragEnd: (details) {
          if (details.localPosition.dy < 200) {
            dragUp!();
          } else if (details.localPosition.dy > 200) {
            dragDown!();
          }
          // print("Saida Local: ${details.localPosition.dy}");
          // print("Saida Global: ${details.globalPosition.dy}");
        },
        child: Container(
          // margin: const EdgeInsets.all(8),
          // padding: const EdgeInsets.all(16),
          color: color,
          child: Center(
            child: Text(value, style: Theme.of(context).textTheme.displayLarge),
          ),
        ),
      ),
    );
  }
}
