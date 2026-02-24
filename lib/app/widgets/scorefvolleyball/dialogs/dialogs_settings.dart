import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoref_manager/app/core/components/quantity_selector.dart';
import 'package:scoref_manager/app/core/components/switch_custom.dart';
import 'package:scoref_manager/app/core/components/text_field_default.dart';
import 'package:scoref_manager/app/widgets/dialogs/dialogs_default.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/models/player_volleyball.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/volleyball_score_controller.dart';

class DialogsSettings extends StatefulWidget {
  final VolleyballScoreController volleyballScoreController;
  final PlayerVolleyball player1;
  final PlayerVolleyball player2;

  const DialogsSettings({
    super.key,
    required this.volleyballScoreController,
    required this.player1,
    required this.player2,
  });

  @override
  State<DialogsSettings> createState() => _DialogsSettingsState();
}

class _DialogsSettingsState extends State<DialogsSettings> {
  late int fullPoints;
  late TextEditingController team1Controller = TextEditingController();
  late TextEditingController team2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    fullPoints =
        widget.volleyballScoreController.settingsManager.value.fullPoints;
    team1Controller = TextEditingController(text: widget.player1.name);
    team2Controller = TextEditingController(text: widget.player2.name);
  }

  void _submit() {
    widget.volleyballScoreController.changeSettings(fullPoints);
    if (team1Controller.text.trim() != widget.player1.name) {
      widget.volleyballScoreController.changeNamePlayer(
        name: team1Controller.text.trim(),
        player: widget.player1,
      );
    }
    if (team2Controller.text.trim() != widget.player2.name) {
      widget.volleyballScoreController.changeNamePlayer(
        name: team2Controller.text.trim(),
        player: widget.player2,
      );
    }

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return DialogsDefault(
          title: "Configurações ",
          onCancel: Get.back,
          onConfirm: _submit,
          child: Column(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          widget.volleyballScoreController.selectSession.value =
                              0;
                        },
                        child: Container(
                          height: 32,
                          width: constraints.maxWidth / 2,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: widget.volleyballScoreController
                                        .selectSession.value ==
                                    0
                                ? Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  )
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              "Geral",
                              style: TextStyle(
                                fontWeight: widget.volleyballScoreController
                                            .selectSession.value ==
                                        0
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          widget.volleyballScoreController.selectSession.value =
                              1;
                        },
                        child: Container(
                          height: 32,
                          width: constraints.maxWidth / 2,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: widget.volleyballScoreController
                                        .selectSession.value ==
                                    1
                                ? Border(
                                    bottom: BorderSide(
                                      width: 1,
                                      color: Theme.of(context).dividerColor,
                                    ),
                                  )
                                : null,
                          ),
                          child: Center(
                              child: Text(
                            "Times",
                            style: TextStyle(
                              fontWeight: widget.volleyballScoreController
                                          .selectSession.value ==
                                      1
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              Flexible(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, animation) {
                    final offsetAnimation = Tween<Offset>(
                      begin: const Offset(0.03, 0), // leve slide
                      end: Offset.zero,
                    ).animate(animation);

                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      ),
                    );
                  },
                  child: KeyedSubtree(
                    key: ValueKey(
                      widget.volleyballScoreController.selectSession.value,
                    ),
                    child: buildSettings(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildSettings() {
    switch (widget.volleyballScoreController.selectSession.value) {
      case 0:
        return _buildSettingsAll();
      case 1:
        return _buildSettingsPlayers();
      default:
        return _buildSettingsAll();
    }
  }

  Widget _buildSettingsAll() {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Column(
          spacing: 24,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Column(
                  spacing: 12,
                  children: [
                    Row(
                      spacing: 12,
                      mainAxisAlignment: Get.width < 800
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.start,
                      children: [
                        Text(
                          "Limitar pontos",
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color,
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontSize,
                          ),
                          maxLines: 3,
                        ),
                        InkWell(
                          onTap:
                              widget.volleyballScoreController.limitPoints.value
                                  ? () {
                                      widget.volleyballScoreController
                                          .changeRuleFullPoints(false);
                                    }
                                  : () {
                                      widget.volleyballScoreController
                                          .changeRuleFullPoints(true);
                                    },
                          child: SwitchCustom(
                            value: widget
                                .volleyballScoreController.limitPoints.value,
                          ),
                        ),
                      ],
                    ),
                    if (widget.volleyballScoreController.limitPoints.value)
                      Row(
                        mainAxisAlignment: Get.width < 800
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.start,
                        spacing: 14,
                        children: [
                          Text(
                            "Total de pontos",
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.fontSize,
                            ),
                          ),
                          QuantitySelector(
                            onChanged: (value) {
                              setState(() {
                                fullPoints = value;
                              });
                            },
                            value: widget.volleyballScoreController
                                .settingsManager.value.fullPoints,
                          ),
                        ],
                      ),
                  ],
                )),
            Obx(
              () => Row(
                mainAxisAlignment: Get.width < 800
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                spacing: 14,
                children: [
                  Text(
                    "Mostrar botões",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium?.fontSize,
                    ),
                    maxLines: 3,
                  ),
                  InkWell(
                    onTap: widget.volleyballScoreController.changeShowButton,
                    child: SwitchCustom(
                      value: widget.volleyballScoreController.showButton.value,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildSettingsPlayers() {
    // return Obx(
    //   () =>
    return Row(
      spacing: 24,
      children: [
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
            ),
            child: SingleChildScrollView(
              child: Column(
                spacing: 12,
                children: [
                  SizedBox(height: 4),
                  CustomTextFieldDefault(
                    text: "Nome do time 1",
                    nameHint: widget.player1.name,
                    textEditingController: team1Controller,
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 12,
                    children: widget.volleyballScoreController.colors.map(
                      (color) {
                        return _buildColorOption(
                          color: color,
                          selected: widget.player1.color == color,
                          onTap: () {
                            setState(() {
                              widget.volleyballScoreController
                                  .changeColorsPlayer(
                                color: color,
                                player: widget.player1,
                              );
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
            ),
            child: SingleChildScrollView(
              child: Column(
                spacing: 12,
                children: [
                  SizedBox(height: 4),
                  CustomTextFieldDefault(
                    text: "Nome do time 2",
                    nameHint: widget.player2.name,
                    textEditingController: team2Controller,
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 12,
                    children: widget.volleyballScoreController.colors.map(
                      (color) {
                        return _buildColorOption(
                          color: color,
                          selected: widget.player2.color == color,
                          onTap: () {
                            setState(() {
                              widget.volleyballScoreController
                                  .changeColorsPlayer(
                                color: color,
                                player: widget.player2,
                              );
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      // ),
    );
  }

  Widget _buildColorOption({
    required Color color,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: selected
              ? Border.all(color: Theme.of(context).dividerColor, width: 3)
              : Border.all(
                  color: Theme.of(context).focusColor,
                  width: 1,
                ),
        ),
      ),
    );
  }
}
