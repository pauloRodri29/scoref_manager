import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scoref_manager/core/components/custom_card.dart';
import 'package:scoref_manager/widgets/scorefvolleyball/volleyball_score_store.dart';

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

  VolleyballScoreStore _scorefVolleyball = VolleyballScoreStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Icon(Icons.sports_volleyball),
            Expanded(
              child: Observer(
                builder: (_) {
                  return Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              _scorefVolleyball.resetStoreTeam1();
                            },
                            icon: const Icon(
                              Icons.exposure_zero,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _scorefVolleyball.incrementStoreTeam1();
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _scorefVolleyball.decrementStorieTeam1();
                            },
                            icon: const Icon(
                              Icons.settings_backup_restore_rounded,
                            ),
                          ),
                        ],
                      ),
                      CustomCardScoreVolleyballWidget(
                        score: _scorefVolleyball.scoreTeam1.toString(),
                        color: Colors.deepPurpleAccent,
                      ),
                      CustomCardScoreVolleyballWidget(
                        score: _scorefVolleyball.scoreTeam2.toString(),
                        color: Colors.deepOrange,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              _scorefVolleyball.resetStoreTeam2();
                            },
                            icon: const Icon(
                              Icons.exposure_zero,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _scorefVolleyball.incrementStoreTeam2();
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _scorefVolleyball.decrementStorieTeam2();
                            },
                            icon: const Icon(
                              Icons.settings_backup_restore_rounded,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
