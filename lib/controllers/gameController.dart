import 'package:get/get.dart';
import 'package:ignitev2/models/gameinfo.dart';
import 'package:ignitev2/services/api.dart';
import '../models/game.dart';

class GameController extends GetxController {
  var populargames = <GameModel>[].obs;
  var upcominggames = <GameModel>[].obs;
  var newgames = <GameModel>[].obs;
  var info = GameDetailsModel().obs;

  @override
  void onInit() {
    fetchGames();
    super.onInit();
  }

  void fetchGames() async {
    var popular = await ApiService.getPopularGames();
    populargames.value = popular;
    var upcoming = await ApiService.getUpcomingGames();
    upcominggames.value = upcoming;
    var newgame = await ApiService.getNewGames();
    newgames.value = newgame;
  }
}
