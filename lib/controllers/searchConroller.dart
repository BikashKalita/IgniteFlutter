import 'package:get/get.dart';
import 'package:ignitev2/models/serachmodel.dart';
import 'package:ignitev2/services/api.dart';

class SearchController extends GetxController {
  var isLoading = true.obs;
  var searchGames = <GameSearchModel>[].obs;
  Future<void> getSearchResult(String name) async {
    try {
      isLoading(true);
      var games = await ApiService.gameSearch(name);
      if (searchGames != null) {
        searchGames.value = games;
      }
    } finally {
      isLoading(false);
    }
  }
}
