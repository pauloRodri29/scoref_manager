import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    this.colorCard,
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
                                  fontWeight: FontWeight.bold),
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
