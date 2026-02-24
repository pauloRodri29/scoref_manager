import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/components/button_custom.dart';

class DialogsDefault extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget child;
  final double? width;
  final double? height;
  final Color? colorCard;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  const DialogsDefault({
    super.key,
    this.title,
    required this.child,
    this.width,
    this.height,
    this.titleWidget,
    this.colorCard,
    this.onCancel,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: width ?? (Get.width < 800 ? Get.width : Get.width * 0.6),
            maxHeight: height ?? Get.height * 0.8,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Card(
              color: colorCard ?? Theme.of(context).cardTheme.color,
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
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.color,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Get.back();
                              });
                            },
                            child: Icon(
                              Icons.close,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: child,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonCustom(
                              filled: false,
                              label: "Cancelar",
                              onPressed: onCancel,
                            ),
                            ButtonCustom(
                              label: "Confirmar",
                              onPressed: onConfirm,
                            ),
                          ],
                        ),
                      ),
                    )
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
