// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ignitev2/constants/colors.dart';

class ButtomNavigation extends StatefulWidget {
  const ButtomNavigation({Key? key}) : super(key: key);

  @override
  State<ButtomNavigation> createState() => _ButtomNavigationState();
}

class _ButtomNavigationState extends State<ButtomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff6f8ff),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10)
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(20)),
          child: BottomNavigationBar(
              // backgroundColor: Colors.white,
              selectedItemColor: kPrimary,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              unselectedItemColor: Colors.grey.withOpacity(0.7),
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(
                      Icons.home_rounded,
                      size: 40,
                    )),
                _buildItem("Home", Icons.search_rounded),
                _buildItem("Home", Icons.arrow_right_rounded),
                _buildItem("Home", Icons.search_rounded),
              ]),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(String text, IconData icon) {
    return BottomNavigationBarItem(
        label: text,
        icon: Container(
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            icon,
            size: 30,
            color: Colors.grey,
          ),
        ));
  }
}
