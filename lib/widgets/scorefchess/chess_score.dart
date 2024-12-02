import 'package:flutter/material.dart';
import 'package:scoref_manager/core/components/error_widget.dart';

class ScorefChessPage extends StatefulWidget {
  const ScorefChessPage({super.key});

  @override
  State<ScorefChessPage> createState() => _ScorefChessPageState();
}

class _ScorefChessPageState extends State<ScorefChessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CustomErrorWidget(
        icon: Icons.precision_manufacturing_rounded,
        message: "Tela em Manuntenção",
      ),
    );
  }
}
