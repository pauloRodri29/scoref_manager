import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/components/button_custom.dart';

class CustomTemporaryWidget extends StatelessWidget {
  final String message;
  final IconData icon;
  final VoidCallback onBack;
  const CustomTemporaryWidget({
    super.key,
    required this.message,
    required this.icon,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          Icon(
            icon,
            size: 48,
          ),
          ButtonCustom(
            label: "Voltar",
            filled: true,
            onPressed: onBack,
          ),
        ],
      ),
    );
  }
}
