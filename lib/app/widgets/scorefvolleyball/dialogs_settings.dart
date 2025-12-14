import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/components/quantity_selector.dart';
import 'package:scoref_manager/app/widgets/dialogs/dialogs_default.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/volleyball_score_controller.dart';

class DialogsSettings extends StatefulWidget {
  final VolleyballScoreController volleyballScoreController;

  const DialogsSettings({super.key, required this.volleyballScoreController});

  @override
  State<DialogsSettings> createState() => _DialogsSettingsState();
}

class _DialogsSettingsState extends State<DialogsSettings> {
  int fullPoints = 1;
  @override
  Widget build(BuildContext context) {
    return DialogsDefault(
      title: "Configurações",
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Total de Pontos da partida",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 10),
            QuantitySelector(
              onChanged: (value) {
                setState(() {
                  fullPoints = value;
                });
              },
              value: widget
                  .volleyballScoreController.settingsManager.value.fullPoints,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  widget.volleyballScoreController.changeSettings(fullPoints);
                  Get.back();
                },
                child: const Text("Salvar"),
              ),
            )
          ],
        )
      ],
    );
  }
}
