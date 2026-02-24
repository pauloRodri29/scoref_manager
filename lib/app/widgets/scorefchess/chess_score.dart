import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/components/temporary_widget.dart';
import 'package:scoref_manager/app/widgets/scorefchess/chess_score_controller.dart';

class ScorefChessPage extends StatefulWidget {
  const ScorefChessPage({super.key});

  @override
  State<ScorefChessPage> createState() => _ScorefChessPageState();
}

class _ScorefChessPageState extends State<ScorefChessPage> {
  final ChessScoreController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomTemporaryWidget(
      message: "Em desenvolvimento",
      icon: Icons.settings,
      onBack: () => Get.back(),
    ));
  }
}
