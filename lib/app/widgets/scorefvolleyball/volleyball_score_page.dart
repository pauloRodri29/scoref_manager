import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/components/button_custom.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';
import 'package:scoref_manager/app/utils/full_screen_helper.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/dialogs/change_name_team_dialog.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/dialogs/dialogs_settings.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/volleyball_score_controller.dart';
import 'package:universal_platform/universal_platform.dart';

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
    // Só aplica orientação no mobile
    if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      // Entra em fullscreen no mobile
      FullscreenHelper.enterFullscreen();
    }
  }

  @override
  void dispose() {
    // Só reseta orientação no mobile
    if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      FullscreenHelper.exitFullscreen();
    }
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

  double sizeButtomcard = 50;

  @override
  Widget build(BuildContext context) {
    // Detecta se está em modo paisagem (landscape)
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Para web, considera landscape se a largura for maior que a altura
    final shouldUseLandscapeLayout =
        isLandscape || (UniversalPlatform.isWeb && screenWidth > screenHeight);

    return GetBuilder<VolleyballScoreController>(
      init: VolleyballScoreController(),
      initState: (_) {},
      builder: (volleyballScoreController) {
        return Scaffold(
          appBar: shouldUseLandscapeLayout
              ? AppBar(
                  automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  backgroundColor: AppColors.backgroundDark,
                  title: Stack(
                    children: [
                      Row(
                        children: [
                          if (UniversalPlatform.isWeb ||
                              UniversalPlatform.isDesktop)
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppColors.backgroundLight,
                              ),
                            ),
                          Row(
                            children: [
                              SizedBox(width: 12),
                              Text(
                                volleyballScoreController.player1.value.name,
                                style: TextStyle(
                                  color: AppColors.backgroundLight,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.dialog(ChangeNameTeamDialog(
                                    volleyballScoreController:
                                        volleyballScoreController,
                                    player:
                                        volleyballScoreController.player1.value,
                                  ));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: AppColors.backgroundLight,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              volleyballScoreController.player1.value.victory
                                  .toString(),
                              style: TextStyle(
                                color: AppColors.backgroundLight,
                              ),
                            ),
                            const SizedBox(width: 6),
                            IconButton(
                              onPressed: controller.resetVitory,
                              icon: Icon(
                                Icons.refresh,
                                color: AppColors.backgroundLight,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              volleyballScoreController.player2.value.victory
                                  .toString(),
                              style: TextStyle(
                                color: AppColors.backgroundLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.dialog(ChangeNameTeamDialog(
                                  volleyballScoreController:
                                      volleyballScoreController,
                                  player:
                                      volleyballScoreController.player2.value,
                                ));
                              },
                              icon: Icon(
                                Icons.edit,
                                color: AppColors.backgroundLight,
                              ),
                            ),
                            Text(
                              volleyballScoreController.player2.value.name,
                              style: TextStyle(
                                color: AppColors.backgroundLight,
                              ),
                            ),
                            SizedBox(width: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : null,
          body: SafeArea(
            child: shouldUseLandscapeLayout
                ? _buildLandscapeLayout(volleyballScoreController)
                : _buildPortraitWarning(),
          ),
        );
      },
    );
  }

  Widget _buildLandscapeLayout(
      VolleyballScoreController volleyballScoreController) {
    return Stack(
      children: [
        Row(
          children: [
            // Time A
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanUpdate: (details) =>
                    _handleSwipe(details, controller.player1.value.name),
                onPanEnd: (_) => _resetSwipeFlags(),
                child: Container(
                  alignment: Alignment.center,
                  color: controller.player1.value.color,
                  child: Text(
                    controller.player1.value.points.toString(),
                    textAlign: TextAlign.center,
                    textHeightBehavior: const TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false,
                    ),
                    style: TextStyle(
                      color: AppColors.backgroundLight,
                      fontSize: 300,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            // Time B
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanUpdate: (details) =>
                    _handleSwipe(details, controller.player2.value.name),
                onPanEnd: (_) => _resetSwipeFlags(),
                child: Container(
                  alignment: Alignment.center,
                  color: controller.player2.value.color,
                  child: Text(
                    controller.player2.value.points.toString(),
                    textAlign: TextAlign.center,
                    textHeightBehavior: const TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false,
                    ),
                    style: TextStyle(
                      color: AppColors.backgroundLight,
                      fontSize: 300,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (volleyballScoreController.showButton.value)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 4, top: 4),
              child: Column(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
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
                        controller.increment(controller.player1.value.name);
                      },
                      icon: Icon(
                        Icons.arrow_upward,
                        size: 32,
                        color: AppColors.backgroundLight,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
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
                        controller.decrement(controller.player1.value.name);
                      },
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppColors.backgroundLight,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (volleyballScoreController.showButton.value)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 4, top: 4),
              child: Column(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
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
                        controller.increment(controller.player2.value.name);
                      },
                      icon: Icon(
                        Icons.arrow_upward,
                        color: AppColors.backgroundLight,
                        size: 32,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
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
                        controller.decrement(controller.player2.value.name);
                      },
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppColors.backgroundLight,
                        size: 32,
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
                    controller.resetPoints();
                  },
                  child: Icon(
                    Icons.refresh,
                    size: 24,
                    color: AppColors.backgroundLight,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Botão de fullscreen na web
              if (UniversalPlatform.isWeb)
                InkWell(
                  onTap: () {
                    FullscreenHelper.toggleFullscreen();
                  },
                  child: Container(
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
                    child: Icon(
                      Icons.fullscreen,
                      color: AppColors.backgroundLight,
                    ),
                  ),
                ),
              const SizedBox(height: 12),
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
                      volleyballScoreController: volleyballScoreController,
                    ));
                  },
                  child: Icon(
                    Icons.settings,
                    size: 24,
                    color: AppColors.backgroundLight,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPortraitWarning() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.screen_rotation,
              size: 80,
              color: AppColors.textSecondaryLight,
            ),
            const SizedBox(height: 24),
            Text(
              'Gire sua tela para o modo paisagem',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Esta tela funciona melhor na horizontal',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondaryLight.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            // Botão para entrar em fullscreen na web
            if (UniversalPlatform.isWeb) ...[
              const SizedBox(height: 32),
              ButtonCustom(
                label: "Entrar em Tela Cheia",
                onPressed: () {
                  FullscreenHelper.toggleFullscreen();
                },
              )
              // ElevatedButton.icon(
              //   onPressed: () {
              //   },
              //   icon: Icon(Icons.fullscreen),
              //   label: Text('Entrar em Tela Cheia'),
              //   style: ElevatedButton.styleFrom(
              //     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              //   ),
              // ),
            ],
          ],
        ),
      ),
    );
  }
}
