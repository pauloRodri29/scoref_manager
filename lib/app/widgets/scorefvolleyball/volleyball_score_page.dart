import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/dialogs_settings.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/volleyball_score_controller.dart';

class ScorefVolleyballPage extends StatefulWidget {
  const ScorefVolleyballPage({super.key});

  @override
  State<ScorefVolleyballPage> createState() => _ScorefVolleyballPageState();
}

class _ScorefVolleyballPageState extends State<ScorefVolleyballPage> {
  final VolleyballScoreController controller =
      Get.put(VolleyballScoreController());

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  // Flags para controlar o swipe
  bool _swipeProcessed = false;

  void _handleSwipe(DragUpdateDetails details, String player) {
    final dy = details.delta.dy;
    if (dy < 0) {
      // Swipe para cima → incrementa
      if (!_swipeProcessed) {
        controller.increment(player);
        _swipeProcessed = true;
      }
    } else if (dy > 0) {
      // Swipe para baixo → decrementa
      if (!_swipeProcessed) {
        controller.decrement(player);
        _swipeProcessed = true;
      }
    }
  }

  void _resetSwipeFlags() {
    _swipeProcessed = false;
  }

  OverlayEntry? _overlayEntry;

  OverlayEntry _buildOverlay() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          right: 20,
          top: 100,
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: [
                FloatingActionButton.small(
                  onPressed: () {
                    controller.resetPoints();
                    _closeOverlay();
                  },
                  child: Icon(Icons.refresh),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.small(
                  onPressed: () {
                    controller.increment(controller.player1.value.name);
                    _closeOverlay();
                  },
                  child: Icon(Icons.add),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.small(
                  onPressed: () {
                    controller.decrement(controller.player1.value.name);
                    _closeOverlay();
                  },
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openOverlay() {
    _overlayEntry = _buildOverlay();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  double sizeButtomcard = 50;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VolleyballScoreController>(
      init: VolleyballScoreController(),
      initState: (_) {},
      builder: (volleyballScoreController) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (_overlayEntry == null) {
                          _openOverlay();
                        } else {
                          _closeOverlay();
                        }
                      },
                      icon: Icon(
                        Icons.edit,
                        color:
                            Theme.of(context).iconTheme.color, // pega do tema
                      ),
                    ),
                    Text(volleyballScoreController.player1.value.name,
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          volleyballScoreController.player1.value.victory
                              .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 6),
                      IconButton(
                        onPressed: controller.resetVitory,
                        icon: Icon(
                          Icons.refresh,
                          color:
                              Theme.of(context).iconTheme.color, // pega do tema
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                          volleyballScoreController.player2.value.victory
                              .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(volleyballScoreController.player2.value.name,
                        style: Theme.of(context).textTheme.titleLarge),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color:
                            Theme.of(context).iconTheme.color, // pega do tema
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Row(
                  children: [
                    // Time A
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onPanUpdate: (details) => _handleSwipe(
                            details, controller.player1.value.name),
                        onPanEnd: (_) => _resetSwipeFlags(),
                        child: Container(
                          alignment: Alignment.center,
                          color: controller.player1.value.color,
                          child: Text(
                              controller.player1.value.points.toString(),
                              style: Theme.of(context).textTheme.displayLarge),
                        ),
                      ),
                    ),
                    // Time B
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onPanUpdate: (details) => _handleSwipe(
                            details, controller.player2.value.name),
                        onPanEnd: (_) => _resetSwipeFlags(),
                        child: Container(
                          alignment: Alignment.center,
                          color: controller.player2.value.color,
                          child: Text(
                              controller.player2.value.points.toString(),
                              style: Theme.of(context).textTheme.displayLarge),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: sizeButtomcard,
                          height: sizeButtomcard,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.textSecondaryLight,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {
                              controller
                                  .increment(controller.player1.value.name);
                            },
                            icon: Icon(
                              Icons.arrow_upward,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color, // pega do tema
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: sizeButtomcard,
                          height: sizeButtomcard,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.textSecondaryLight,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {
                              controller
                                  .decrement(controller.player1.value.name);
                            },
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color, // pega do tema
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: sizeButtomcard,
                          height: sizeButtomcard,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.textSecondaryLight,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {
                              controller
                                  .increment(controller.player2.value.name);
                            },
                            icon: Icon(
                              Icons.arrow_upward,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color, // pega do tema
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: sizeButtomcard,
                          height: sizeButtomcard,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.textSecondaryLight,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {
                              controller
                                  .decrement(controller.player2.value.name);
                            },
                            icon: Icon(
                              Icons.arrow_downward,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color, // pega do tema
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.textSecondaryLight,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.dialog(DialogsSettings(
                              volleyballScoreController:
                                  volleyballScoreController,
                            ));
                            // controller.changeSettings(6);
                          },
                          child: Icon(
                            Icons.settings,
                            size: 24,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 12), // espaço entre o círculo e o botão
                      // Círculo com "X"
                      Text(
                        "X",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      // Container(
                      //   width: 40,
                      //   height: 40,
                      //   alignment: Alignment.center,
                      //   decoration: BoxDecoration(
                      //     color: AppColors.textSecondaryLight,
                      //     shape: BoxShape.circle,
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.black.withValues(alpha: 0.3),
                      //         blurRadius: 8,
                      //         offset: const Offset(0, 4),
                      //       ),
                      //     ],
                      //   ),
                      //   child: Text(
                      //     "X",
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .headlineLarge
                      //         ?.copyWith(fontWeight: FontWeight.bold),
                      //   ),
                      // ),

                      const SizedBox(
                          height: 12), // espaço entre o círculo e o botão

                      // Botão com ícone
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.textSecondaryLight,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            controller.resetPoints();
                          },
                          child: Icon(
                            Icons.refresh,
                            size: 24,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
