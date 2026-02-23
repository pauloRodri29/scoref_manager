import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';

class DialogsDefault extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget> children;
  final double? width;
  final double? height;
  final Color? colorCard;

  const DialogsDefault({
    super.key,
    this.title,
    required this.children,
    this.width,
    this.height,
    this.titleWidget,
    this.colorCard = AppColors.backgroundDark,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: width ?? Get.height,
            maxHeight: height ?? Get.height,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Card(
              color: colorCard,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.black.withValues(alpha: 0.08),
              //       blurRadius: 10,
              //       offset: const Offset(0, 4),
              //     ),
              //   ],
              // ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cabeçalho
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titleWidget ??
                            Text(
                              title ?? "---",
                              style: TextStyle(
                                  color: AppColors.textOnPrimaryLight),
                            ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Get.back();
                              });
                            },
                            child: const Icon(
                              Icons.close,
                              color: AppColors.backgroundLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(children: children),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
