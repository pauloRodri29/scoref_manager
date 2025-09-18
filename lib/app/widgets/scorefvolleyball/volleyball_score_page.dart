import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';
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
  bool _swipeProcessedA = false;
  bool _swipeProcessedB = false;

  void _handleSwipe(DragUpdateDetails details, bool isTeamA) {
    final dy = details.delta.dy;
    if (dy < 0) {
      // Swipe para cima → incrementa
      if (isTeamA && !_swipeProcessedA) {
        controller.incrementScoreA();
        _swipeProcessedA = true;
      } else if (!isTeamA && !_swipeProcessedB) {
        controller.incrementScoreB();
        _swipeProcessedB = true;
      }
    } else if (dy > 0) {
      // Swipe para baixo → decrementa
      if (isTeamA && !_swipeProcessedA) {
        controller.decrementScoreA();
        _swipeProcessedA = true;
      } else if (!isTeamA && !_swipeProcessedB) {
        controller.decrementScoreB();
        _swipeProcessedB = true;
      }
    }
  }

  void _resetSwipeFlags(bool isTeamA) {
    if (isTeamA) {
      _swipeProcessedA = false;
    } else {
      _swipeProcessedB = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Obx(() {
          final s = controller.settings.value;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(s.nameTeam1,
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${s.victoryTeam1}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 6),
                    IconButton(
                      onPressed: controller.resetSets,
                      icon: Icon(
                        Icons.refresh,
                        color:
                            Theme.of(context).iconTheme.color, // pega do tema
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text("${s.victoryTeam2}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(s.nameTeam2,
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ],
          );
        }),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Obx(() {
              final s = controller.settings.value;
              return Row(
                children: [
                  // Time A
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onPanUpdate: (details) => _handleSwipe(details, true),
                      onPanEnd: (_) => _resetSwipeFlags(true),
                      child: Container(
                        alignment: Alignment.center,
                        color: s.colorTeam1,
                        child: Text("${s.scoreTeam1}",
                            style: Theme.of(context).textTheme.displayLarge),
                      ),
                    ),
                  ),
                  // Time B
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onPanUpdate: (details) => _handleSwipe(details, false),
                      onPanEnd: (_) => _resetSwipeFlags(false),
                      child: Container(
                        alignment: Alignment.center,
                        color: s.colorTeam2,
                        child: Text("${s.scoreTeam2}",
                            style: Theme.of(context).textTheme.displayLarge),
                      ),
                    ),
                  ),
                ],
              );
            }),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Círculo com "X"
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
                    child: Text(
                      "X",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),

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
                    child: GestureDetector(
                      onTap: () {
                       controller.resetScores();
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
  }
}
