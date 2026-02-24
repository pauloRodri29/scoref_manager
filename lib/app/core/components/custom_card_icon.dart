import 'package:flutter/material.dart';

class CustomCardIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  final double fontSize;
  const CustomCardIcon({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Positioned(
            //   right: 100,
            //   bottom: -10,
            //   child: Opacity(
            //     opacity: 0.1,
            //     child: Icon(
            //       icon,
            //       size: fontSize * 5,
            //       color: Theme.of(context).iconTheme.color,
            //     ),
            //   ),
            // ),

            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: fontSize * 2,
                height: fontSize * 2,
                child: OverflowBox(
                  maxWidth: fontSize * 4,
                  maxHeight: fontSize * 4,
                  child: Opacity(
                    opacity: 0.1,
                    child: Icon(
                      icon,
                      size: fontSize * 5,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ),
            ), // Conteúdo real do card
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight:
                        Theme.of(context).textTheme.headlineLarge?.fontWeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
