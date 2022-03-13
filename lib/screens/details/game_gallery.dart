import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ignitev2/controllers/gamedetailsController.dart';

class GameGallery extends StatelessWidget {
  const GameGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<GameDetailsController>();
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => SizedBox(
                width: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    _controller.gameInfo.value.screenshots![index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          separatorBuilder: (_, index) => SizedBox(
                width: 50,
              ),
          itemCount: _controller.gameInfo.value.screenshots!.length),
    );
  }
}
