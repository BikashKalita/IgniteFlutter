// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ignitev2/screens/home/widgets/new_games.dart';
import 'package:ignitev2/screens/home/widgets/popular_game.dart';
import 'package:ignitev2/screens/home/widgets/upcoming_game.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catList = [
      {
        'icon': Icons.track_changes_outlined,
        'color': Color(0xFF605CF4),
        'title': 'Arcade',
      },
      {
        'icon': Icons.sports_motorsports_outlined,
        'color': Color(0xFFFC77A6),
        'title': 'Racing',
      },
      {
        'icon': Icons.casino_outlined,
        'color': Color(0xFF4391FF),
        'title': 'Strategy',
      },
      {
        'icon': Icons.sports_esports,
        'color': Color(0xFF7182F2),
        'title': 'More',
      },
    ];
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFF6F8FF),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Container(
            height: 140,
            padding: EdgeInsets.all(25),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Column(children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: catList[index]['color'] as Color),
                        child: Icon(
                          catList[index]['icon'] as IconData,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        catList[index]['title'] as String,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.7)),
                      )
                    ]),
                separatorBuilder: (_, index) => SizedBox(
                      width: 33,
                    ),
                itemCount: catList.length),
          ),
          _buildTitle("Popular Games"),
          PopularGames(),
          _buildTitle("Upcoming Games"),
          UpcomingGames(),
          _buildTitle("New Games"),
          NewGame()
        ],
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      width: double.maxFinite,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
