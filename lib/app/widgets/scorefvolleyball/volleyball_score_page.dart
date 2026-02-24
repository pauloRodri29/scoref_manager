import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/components/real_time_clock.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';
import 'package:scoref_manager/app/utils/full_screen_helper.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/dialogs/dialogs_settings.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/volleyball_score_controller.dart';
import 'package:universal_platform/universal_platform.dart';

class ScorefVolleyballPage extends StatefulWidget {
  const ScorefVolleyballPage({super.key});

  @override
  State<ScorefVolleyballPage> createState() => _ScorefVolleyballPageState();
}

class _ScorefVolleyballPageState extends State<ScorefVolleyballPage> {
  final VolleyballScoreController controller = Get.find();
  // bool showTime = false;

  @override
  void initState() {
    super.initState();
    // Só aplica orientação no mobile
    if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    if (UniversalPlatform.isDesktop || UniversalPlatform.isWeb) {
      // Entra em fullscreen no Desktop ou Web
      FullscreenHelper.enterFullscreen();
    }
    verifyFullScreen();
  }

  Future<void> verifyFullScreen() async {
    setState(() {
      controller.verifyFullScreen();
    });
  }

  void controllerTimeFullscreen() async {
    setState(() {
      FullscreenHelper.toggleFullscreen();
      verifyFullScreen();
    });
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
      builder: (volleyballScoreController) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            backgroundColor: AppColors.backgroundDark,
            title: SizedBox(
              height: kToolbarHeight,
              child: shouldUseLandscapeLayout
                  ? Stack(
                      children: [
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
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
                              SizedBox(width: 12),
                              Text(
                                volleyballScoreController.player1.value.name,
                                style: TextStyle(
                                  color: AppColors.backgroundLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentGeometry.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                volleyballScoreController.player1.value.victory
                                    .toString(),
                                style: TextStyle(
                                  color: AppColors.backgroundLight,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.fontSize,
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
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.fontSize,
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
                    )
                  : Stack(
                      children: [
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
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
                            ],
                          ),
                        ),
                        if ((UniversalPlatform.isWeb ||
                                UniversalPlatform.isDesktop) &&
                            !controller.isFullscreen.value)
                          Align(
                            alignment: AlignmentGeometry.center,
                            child: RealTimeClock(),
                          ),
                        Align(
                          alignment: AlignmentGeometry.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (UniversalPlatform.isWeb)
                                InkWell(
                                  onTap: () {
                                    controllerTimeFullscreen();
                                  },
                                  child: Icon(
                                    Icons.fullscreen,
                                    color: AppColors.backgroundLight,
                                  ),
                                ),
                              const SizedBox(width: 12),
                              InkWell(
                                onTap: () {
                                  Get.dialog(DialogsSettings(
                                    volleyballScoreController:
                                        volleyballScoreController,
                                    player1: controller.player1.value,
                                    player2: controller.player2.value,
                                  ));
                                },
                                child: Icon(
                                  Icons.settings,
                                  size: 24,
                                  color: AppColors.backgroundLight,
                                ),
                              ),
                              SizedBox(width: 12),
                            ],
                          ),
                        )
                      ],
                    ),
            ),
          ),
          // body: SafeArea(child: _buildLandscapeLayout(volleyballScoreController)

          //     )
          body: SafeArea(
            child: shouldUseLandscapeLayout
                ? _buildLandscapeLayout(volleyballScoreController)
                : _buildRetratoLayout(volleyballScoreController),
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
        if ((UniversalPlatform.isWeb || UniversalPlatform.isDesktop) &&
            !controller.isFullscreen.value)
          Align(
            alignment: AlignmentGeometry.topCenter,
            child: Container(
                margin: EdgeInsets.only(top: 4),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.textSecondaryLight,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: RealTimeClock()),
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
                    // FullscreenHelper.toggleFullscreen();
                    controllerTimeFullscreen();
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
                      player1: controller.player1.value,
                      player2: controller.player2.value,
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

  Widget _buildRetratoLayout(
      VolleyballScoreController volleyballScoreController) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: Row(
                      spacing: 4,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          volleyballScoreController.player1.value.victory
                              .toString(),
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.displaySmall?.color,
                            fontSize: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.fontSize,
                          ),
                        ),
                        IconButton(
                          onPressed: controller.resetVitory,
                          icon: Icon(
                            Icons.refresh,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        Text(
                          volleyballScoreController.player2.value.victory
                              .toString(),
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.displaySmall?.color,
                            fontSize: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.fontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          volleyballScoreController.player1.value.name,
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.displaySmall?.color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Icon(
                        Icons.close,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      Expanded(
                        child: Text(
                          volleyballScoreController.player2.value.name,
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.displaySmall?.color,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
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
                          child: Stack(
                            children: [
                              Container(
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
                                    fontSize: 110,
                                    height: 1.0,
                                  ),
                                ),
                              ),
                            ],
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
                              textAlign: TextAlign.center,
                              textHeightBehavior: const TextHeightBehavior(
                                applyHeightToFirstAscent: false,
                                applyHeightToLastDescent: false,
                              ),
                              style: TextStyle(
                                color: AppColors.backgroundLight,
                                fontSize: 110,
                                height: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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

                        // Botão de fullscreen na web
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (volleyballScoreController.showButton.value)
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4, top: 4),
                          child: Row(
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
                                      color:
                                          Colors.black.withValues(alpha: 0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    controller.increment(
                                        controller.player1.value.name);
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
                                      color:
                                          Colors.black.withValues(alpha: 0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    controller.decrement(
                                        controller.player1.value.name);
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
                      Icon(
                        Icons.sports_volleyball,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4, top: 4),
                          child: Row(
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
                                      color:
                                          Colors.black.withValues(alpha: 0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    controller.increment(
                                        controller.player2.value.name);
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
                                      color:
                                          Colors.black.withValues(alpha: 0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    controller.decrement(
                                        controller.player2.value.name);
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
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
