import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ignitev2/constants/colors.dart';
import 'package:ignitev2/controllers/searchConroller.dart';
import 'package:ignitev2/screens/details/details.dart';
import 'package:ignitev2/screens/home/widgets/search.dart';

class SerachPage extends StatelessWidget {
  const SerachPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<SearchController>();
    Future.delayed(Duration.zero, () async {
      await _controller.getSearchResult(Get.arguments);
    });
    return Scaffold(
      backgroundColor: kPrimary,
      body: Obx(() => _controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: MediaQuery.of(context).padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Search(),
                  Container(
                      // color: Colors.amber,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: _controller.searchGames.length < 1
                          ? const Text(
                              "No Game Found",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            )
                          : Column(
                              children: _controller.searchGames
                                  .map((e) => GameCard(game: e))
                                  .toList()))
                ],
              ))),
    );
  }
}

class GameCard extends StatelessWidget {
  final game;
  const GameCard({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 100,
      child: InkWell(
        onTap: () => Get.to(const DetailPage(), arguments: game.slug),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              game.backgroundImage,
              width: 150,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              game.name,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
