import 'package:flutter/material.dart';
import 'package:scoref_manager/core/components/temporary_widget.dart';

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
      body: const CustomTempararyWidget(
        icon: Icons.precision_manufacturing_rounded,
        message: "Tela em Manuntenção",
      ),
    );
  }
}
