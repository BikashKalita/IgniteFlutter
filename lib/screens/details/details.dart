import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ignitev2/controllers/gamedetailsController.dart';
import 'package:ignitev2/screens/details/deligate.dart';
import 'package:ignitev2/screens/details/game_info.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GameDetailsController>();
    Future.delayed(Duration.zero, () async {
      await controller.fetchGameDetails(Get.arguments);
    });
    return Scaffold(
        body: Obx(
      () => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: DetailSliverDelegate(
                      expandedHeight: 360.0, roundedContainerHeight: 30.0),
                ),
                const SliverToBoxAdapter(
                  child: GameInfo(),
                )
              ],
            ),
    ));
  }
}
