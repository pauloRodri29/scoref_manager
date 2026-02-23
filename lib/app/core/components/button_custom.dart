import 'package:flutter/material.dart';
import 'package:scoref_manager/app/core/constants/app_fonts_sizes.dart';

class ButtonCustom extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool filled;

  const ButtonCustom({
    super.key,
    required this.label,
    this.onPressed,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    return filled
        ? FilledButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).textTheme.labelSmall?.color,
                fontSize: AppFontSizes.fz08,
              ),
            ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).textTheme.labelSmall?.color,
                fontSize: AppFontSizes.fz08,
              ),
            ),
          );
    // return InkWell(
    //   borderRadius: BorderRadius.circular(20),
    //   onTap: onPressed,
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(20),
    //       color: filled
    //           ? Theme.of(context).buttonTheme.colorScheme?.primary
    //           : Colors.transparent,
    //       border: Border.all(
    //         color: filled ? Colors.transparent : AppColors.surfaceLight,
    //         width: 1,
    //       ),
    //     ),
    //     child: Text(
    //       label,
    //       style: TextStyle(
    //         color: Theme.of(context).primaryColor,
    //         fontSize: AppFontSizes.fz08,
    //       ),
    //     ),
    //   ),
    // );
  }
}
