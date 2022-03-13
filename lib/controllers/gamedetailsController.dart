import 'package:get/get.dart';
import 'package:ignitev2/services/api.dart';

import '../models/gameinfo.dart';

class GameDetailsController extends GetxController {
  var isLoading = true.obs;
  var gameInfo = GameDetailsModel().obs;

  Future<void> fetchGameDetails(String slug) async {
    try {
      isLoading(true);
      var info = await ApiService.getGameDetails(slug);
      if (info != null) {
        gameInfo.value = info;
      }
    } finally {
      isLoading(false);
    }
  }
}
