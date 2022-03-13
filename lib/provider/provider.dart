import 'package:get/get.dart';

class Provider extends GetConnect {
  Future<dynamic> getGames() async {
    final response = await get(
        "https://rawg-api.herokuapp.com/games?&dates=2022-03-01,2023-03-01&page_size=9");
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      print("Done");
      return response.body;
    }
  }
}
