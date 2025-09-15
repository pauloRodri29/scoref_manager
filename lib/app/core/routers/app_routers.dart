import 'package:get/get.dart';
import 'package:scoref_manager/app/widgets/home/home_page.dart';
import 'package:scoref_manager/app/widgets/scorefvolleyball/volleyball_score.dart';
import 'package:scoref_manager/app/widgets/scorefchess/chess_score.dart';

part 'routers.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routers.INITIAL, page: () => const HomePage()),
    GetPage(name: Routers.VOLLEYBALL, page: () => const ScorefVolleyballPage()),
    GetPage(name: Routers.CHESS, page: () => const ScorefChessPage()),
  ];
}
