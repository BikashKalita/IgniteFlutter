import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ignitev2/screens/details/details.dart';
import '../../../controllers/gameController.dart';

class UpcomingGames extends StatelessWidget {
  const UpcomingGames({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<GameController>();
    return Obx(() => Visibility(
          child: (_controller.upcominggames.isNotEmpty)
              ? SizedBox(
                  height: 200,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => InkWell(
                      onTap: () => Get.to(const DetailPage(),
                          arguments: _controller.upcominggames[index].slug!),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(_controller
                                .upcominggames[index].backgroundImage!),
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (_, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: _controller.upcominggames.length,
                  ),
                )
              : const SizedBox(
                  height: 200,
                ),
        ));
  }
}
