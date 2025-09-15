import 'package:flutter/material.dart';
import 'package:scoref_manager/app/core/components/text_field_default.dart';

class ScorefChessPage extends StatefulWidget {
  const ScorefChessPage({super.key});

  @override
  State<ScorefChessPage> createState() => _ScorefChessPageState();
}

class _ScorefChessPageState extends State<ScorefChessPage> {
  final _textEdit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: CustomTextFieldDefault(
                textEditingController: _textEdit,
                nameHint: "Teste time 1",
              ),
            ),
            TextButton(onPressed: () {}, child: Text("Aperte aqui"))
          ],
        ),
      ),
    );
  }
}
