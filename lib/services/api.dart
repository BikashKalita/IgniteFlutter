import 'dart:convert';
import 'package:ignitev2/models/game.dart';
import 'package:http/http.dart' as http;
import 'package:ignitev2/models/gameinfo.dart';
import 'package:ignitev2/models/serachmodel.dart';

class ApiService {
  final client = http.Client();
  static DateTime d = DateTime.now();
  static String baseURL = "https://rawg-api.herokuapp.com/";

  static Future<List<GameModel>> getPopularGames() async {
    final url = Uri.parse(baseURL +
        "games?&dates=${d.year - 1}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')},${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}&page_size=9");
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return List.from(json)
        .map<GameModel>((e) => GameModel.fromJson(e))
        .toList();
  }

  static Future<List<GameModel>> getUpcomingGames() async {
    final url = Uri.parse(baseURL +
        "games?&dates=${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')},${d.year + 1}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}&page_size=9");
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return List.from(json)
        .map<GameModel>((e) => GameModel.fromJson(e))
        .toList();
  }

  static Future<List<GameModel>> getNewGames() async {
    final url = Uri.parse(baseURL +
        "games?&dates=${d.year - 1}-${d.month.toString().padLeft(2, '0')},${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}&ordering=-released&page_size=6");
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return List.from(json)
        .map<GameModel>((e) => GameModel.fromJson(e))
        .toList();
  }

  static Future<GameDetailsModel> getGameDetails(String slug) async {
    final url = Uri.parse(baseURL + "games/${slug}");
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return gameDetailsModelFromJson(response.body);
  }

  static Future<List<GameSearchModel>> gameSearch(String name) async {
    try {
      final url = Uri.parse(baseURL + "search?name=" + name);
      final respone = await http.get(url);
      final json = jsonDecode(respone.body);
      if (respone.statusCode == 200) {
        return List.from(json)
            .map<GameSearchModel>((e) => GameSearchModel.fromJson(e))
            .toList();
      } else {
        throw Exception('No Search Result');
      }
    } catch (e) {
      return [];
    }
  }
}
