import 'package:flutter/material.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';

class SwitchCustom extends StatelessWidget {
  final bool value;
  final bool isEnabled;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final double width;
  final double height;
  final Duration duration;

  const SwitchCustom({
    super.key,
    required this.value,
    this.isEnabled = true,
    this.activeColor = AppColors.brandLight,
    this.inactiveColor = AppColors.backgroundDarkGrey,
    this.thumbColor = AppColors.textOnPrimaryDark,
    this.width = 42,
    this.height = 22,
    this.duration = const Duration(milliseconds: 250),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      curve: Curves.easeInOut,
      width: width,
      height: height,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: value
            ? activeColor
            : (isEnabled ? inactiveColor : AppColors.backgroundLight),
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: AnimatedAlign(
        duration: duration,
        curve: Curves.easeInOut,
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        child: AnimatedContainer(
          duration: duration,
          width: height - 2, // bolinha proporcional à altura
          height: height - 2,
          decoration: BoxDecoration(
            color: thumbColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.backgroundDark.withValues(alpha: 0.25),
                blurRadius: 3,
                offset: const Offset(0, 2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
