import 'package:get/get.dart';
import 'package:scoref_manager/app/widgets/home/bindings/home_binding.dart';
import 'package:scoref_manager/app/widgets/home/home_page.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/volleyball_score_page.dart';
import 'package:scoref_manager/app/widgets/scorefchess/chess_score.dart';

part 'routers.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: Routers.INITIAL,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routers.VOLLEYBALL,
      page: () => const ScorefVolleyballPage(),
      // binding: VolleyballScoreBinding(),
    ),
    GetPage(
      name: Routers.CHESS,
      page: () => const ScorefChessPage(),
    ),
  ];
}
