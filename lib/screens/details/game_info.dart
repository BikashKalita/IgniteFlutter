import 'package:flutter/material.dart';
import 'package:ignitev2/screens/details/game_description.dart';
import 'package:ignitev2/screens/details/game_gallery.dart';
import 'package:ignitev2/screens/details/game_header.dart';
import 'package:ignitev2/screens/details/game_rating.dart';

class GameInfo extends StatelessWidget {
  const GameInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [GameHeader(), GameGallery(), Description(), Rating()],
      ),
    );
  }
}
