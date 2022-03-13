import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ignitev2/constants/colors.dart';
import 'package:ignitev2/controllers/gamedetailsController.dart';
import 'package:readmore/readmore.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<GameDetailsController>();
    return Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About Game",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            ReadMoreText(
              _controller.gameInfo.value.descriptionRaw!,
              trimLines: 4,
              colorClickableText: kPrimary,
              trimMode: TrimMode.Line,
              style: TextStyle(color: Colors.grey, height: 1.5),
              trimCollapsedText: "More..",
              trimExpandedText: "less",
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
