import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ignitev2/screens/details/details.dart';
import '../../../controllers/gameController.dart';

class NewGame extends StatelessWidget {
  const NewGame({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<GameController>();
    return Obx(() => Container(
        padding: const EdgeInsets.all(25),
        child: (_controller.newgames != null)
            ? Column(
                children: _controller.newgames
                    .map((e) => GameCard(
                          game: e,
                        ))
                    .toList())
            : SizedBox(
                height: 40,
                child: Container(),
              )));
  }
}

class GameCard extends StatelessWidget {
  final game;
  const GameCard({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: InkWell(
          onTap: () => Get.to(const DetailPage(), arguments: game.slug),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  game.backgroundImage,
                  width: 140,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                game.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ));
  }
}
