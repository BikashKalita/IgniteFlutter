import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ignitev2/constants/colors.dart';
import 'package:ignitev2/screens/search/search.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameSearchController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Stack(children: [
        TextField(
          // autofocus: true,
          // onTap: () {
          //   AutofillHints.oneTimeCode;
          // },
          onSubmitted: ((value) =>
              Get.to(const SerachPage(), arguments: value)),
          cursorColor: kPrimary,
          textInputAction: TextInputAction.search,
          controller: gameSearchController,
          decoration: InputDecoration(
              fillColor: const Color(0xFFF6F8FF),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              prefixIcon: const Icon(
                Icons.search_outlined,
                color: kPrimary,
                size: 25,
              ),
              hintText: 'Search 698,337 games',
              hintStyle:
                  TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.7))),
        ),
        Positioned(
            bottom: 6,
            right: 12,
            child: GestureDetector(
              onTap: () => Get.to(const SerachPage()),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPrimary,
                ),
                child: const Icon(
                  Icons.mic_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ))
      ]),
    );
  }
}
