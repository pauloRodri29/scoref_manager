import 'package:flutter/material.dart';

class CustomTemporaryWidget extends StatelessWidget {
  final String message;
  final IconData icon;
  const CustomTemporaryWidget({
    super.key,
    required this.message,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          Icon(
            icon,
            size: 48,
          ),
        ],
      ),
    );
  }
}
