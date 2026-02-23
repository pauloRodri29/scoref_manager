import 'package:get/get.dart';
import 'package:scoref_manager/app/widgets/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // lazyPut carrega o controller apenas quando ele for usado pela primeira vez
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
