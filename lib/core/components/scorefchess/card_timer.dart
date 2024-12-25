import 'package:flutter/material.dart';

class CustomCardTimer extends StatelessWidget {
  final String timer;
  const CustomCardTimer({
    super.key,
    required this.timer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(timer),
    );
  }
}
