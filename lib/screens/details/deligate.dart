import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ignitev2/constants/colors.dart';
import 'package:ignitev2/controllers/gamedetailsController.dart';

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double roundedContainerHeight;

  DetailSliverDelegate({
    required this.expandedHeight,
    required this.roundedContainerHeight,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final _controller = Get.find<GameDetailsController>();
    return Stack(
      children: [
        Image.network(
          _controller.gameInfo.value.backgroundImage!,
          width: MediaQuery.of(context).size.width,
          height: expandedHeight,
          fit: BoxFit.cover,
        ),
        Positioned(
            child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, left: 25, right: 25),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7), shape: BoxShape.circle),
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
          ),
        )),
        Positioned(
            top: expandedHeight - roundedContainerHeight - shrinkOffset,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: roundedContainerHeight,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              alignment: Alignment.center,
              child: Container(
                color: kPrimary,
                height: 5,
                width: 60,
              ),
            ))
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
