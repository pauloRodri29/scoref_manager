import 'package:flutter/material.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';

class CustomButtonIconRound extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final Color colorIcon;
  final Color colorBackground;
  final double? sizeIcon;
  final List<BoxShadow>? boxShadow;

  const CustomButtonIconRound({
    super.key,
    this.onTap,
    required this.icon,
    this.colorIcon = AppColors.backgroundLight,
    this.colorBackground = AppColors.textSecondaryLight,
    this.boxShadow,
    this.sizeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        shape: BoxShape.circle,
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon),
        color: Theme.of(context).iconTheme.color,
        iconSize: sizeIcon ?? 20,
      ),
    );
  }
}
