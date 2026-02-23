import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/components/button_custom.dart';
import 'package:scoref_manager/app/core/components/quantity_selector.dart';
import 'package:scoref_manager/app/core/components/switch_custom.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';
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
    return LayoutBuilder(builder: (context, constraints) {
      return DialogsDefault(
        title: "Configurações Gerais",
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total de Pontos da partida",
                    style: TextStyle(color: AppColors.textOnPrimaryLight),
                  ),
                  SizedBox(height: 10),
                  QuantitySelector(
                    onChanged: (value) {
                      setState(() {
                        fullPoints = value;
                      });
                    },
                    value: widget.volleyballScoreController.settingsManager
                        .value.fullPoints,
                  ),
                  SizedBox(height: 12),
                  Obx(
                    () => Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mostrar Botões de Incrementar/Decrementar",
                          style: TextStyle(color: AppColors.textOnPrimaryLight),
                          maxLines: 3,
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap:
                              widget.volleyballScoreController.changeShowButton,
                          child: SwitchCustom(
                            value: widget
                                .volleyballScoreController.showButton.value,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ButtonCustom(
                label: "Salvar",
                onPressed: () {
                  widget.volleyballScoreController.changeSettings(fullPoints);
                  Get.back();
                },
              ),
            ),
          )
        ],
      );
    });
  }
}
