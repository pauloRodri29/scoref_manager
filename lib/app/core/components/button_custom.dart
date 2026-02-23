import 'package:flutter/material.dart';
import 'package:scoref_manager/app/core/constants/app_fonts_sizes.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';

class ButtonCustom extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color colorButton;
  final Color colorLabel;

  const ButtonCustom({
    super.key,
    required this.label,
    this.onPressed,
    this.colorButton = AppColors.brandMain,
    this.colorLabel = AppColors.backgroundLight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorButton,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: colorLabel,
            fontSize: AppFontSizes.fz08,
          ),
        ),
      ),
    );
  }
}
