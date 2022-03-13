import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ignitev2/controllers/gamedetailsController.dart';

class GameHeader extends StatelessWidget {
  const GameHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<GameDetailsController>();
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        "${_controller.gameInfo.value.name}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text("Action",
                    style: TextStyle(color: Colors.grey.withOpacity(0.8))),
                const SizedBox(
                  height: 5,
                ),
              ],
            )
          ],
        ));
  }
}
