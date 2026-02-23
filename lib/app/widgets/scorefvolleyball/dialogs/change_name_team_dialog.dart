import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/components/button_custom.dart';
import 'package:scoref_manager/app/core/components/text_field_default.dart';
import 'package:scoref_manager/app/widgets/dialogs/dialogs_default.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/models/player_volleyball.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/volleyball_score_controller.dart';

class ChangeNameTeamDialog extends StatefulWidget {
  final VolleyballScoreController volleyballScoreController;
  final PlayerVolleyball player;
  const ChangeNameTeamDialog({
    super.key,
    required this.volleyballScoreController,
    required this.player,
  });

  @override
  State<ChangeNameTeamDialog> createState() => _ChangeNameTeamDialogState();
}

class _ChangeNameTeamDialogState extends State<ChangeNameTeamDialog> {
  TextEditingController teamController = TextEditingController();
  @override
  void initState() {
    super.initState();
    teamController.text = widget.player.name;
  }

  @override
  Widget build(BuildContext context) {
    return DialogsDefault(
      title: "Configurações",
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            CustomTextFieldDefault(
              text: "Nome do time",
              nameHint: widget.player.name,
              textEditingController: teamController,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: widget.volleyballScoreController.colors.map(
                (color) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        widget.volleyballScoreController.changeColorsPlayer(
                          color: color,
                          player: widget.player,
                        );
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: widget.player.color == color
                            ? Border.all(
                                color: Colors.white,
                                width: 3,
                              )
                            : null,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: ButtonCustom(
                  label: "Salvar",
                  onPressed: () {
                    log("Salvar nome do time");
                    widget.volleyballScoreController.changeNamePlayer(
                      name: teamController.text,
                      player: widget.player,
                    );
                    Get.back();
                  },
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
