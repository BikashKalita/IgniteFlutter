import 'package:get/get.dart';
import 'package:ignitev2/controllers/gamedetailsController.dart';
import 'package:ignitev2/controllers/searchConroller.dart';

import '../controllers/gameController.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GameController());
    Get.put(GameDetailsController());
    Get.put(SearchController());
  }
}
