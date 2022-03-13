import 'package:flutter/material.dart';
import 'package:ignitev2/constants/colors.dart';
import 'package:ignitev2/screens/home/widgets/category.dart';
import 'package:ignitev2/screens/home/widgets/header.dart';
import 'package:ignitev2/screens/home/widgets/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [Header(), Search(), Category()],
            )
          ],
        ),
      ),
      // bottomNavigationBar: ButtomNavigation(),
    );
  }
}
