import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scoref_manager/core/components/custom_card.dart';
import 'package:scoref_manager/core/components/volleyball/cards_score.dart';
import 'package:scoref_manager/core/components/volleyball/opction_buton.dart';
import 'package:scoref_manager/widgets/scorefvolleyball/stores/volleyball_score_store.dart';

class ScorefVolleyballPage extends StatefulWidget {
  const ScorefVolleyballPage({super.key});

  @override
  State<ScorefVolleyballPage> createState() => _ScorefVolleyballPageState();
}

class _ScorefVolleyballPageState extends State<ScorefVolleyballPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  final VolleyballScoreStore _scorefVolleyball = VolleyballScoreStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Time 1
                    Text(
                      _scorefVolleyball.nameTeam1,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Row(
                      children: [
                        CardCustomScoreVolleyball(
                          scoreTime: _scorefVolleyball.victoryTeam1,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        OptionButonVolleyball(
                          onPressed: _scorefVolleyball.resetPoint,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        CardCustomScoreVolleyball(
                          scoreTime: _scorefVolleyball.victoryTeam2,
                        ),
                      ],
                    ),
                    //Nome do Time 2
                    Text(
                      _scorefVolleyball.nameTeam2,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      CustomCardScoreVolleyballWidget(
                        dragUp: () {
                          _scorefVolleyball.incrementPointTeam1();
                        },
                        dragDown: () {
                          _scorefVolleyball.decrementPointTeam1();
                        },
                        value: _scorefVolleyball.scoreTeam1.toString(),
                        color: _scorefVolleyball.colorTeam1,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomCardScoreVolleyballWidget(
                        dragUp: () {
                          _scorefVolleyball.incrementPointTeam2();
                        },
                        dragDown: () {
                          _scorefVolleyball.decrementPointTeam2();
                        },
                        value: _scorefVolleyball.scoreTeam2.toString(),
                        color: _scorefVolleyball.colorTeam2,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
