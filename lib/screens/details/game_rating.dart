import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ignitev2/constants/colors.dart';
import 'package:ignitev2/controllers/gamedetailsController.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<GameDetailsController>();
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Rating and Reviews",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "view",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                _controller.gameInfo.value.rating.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  _buildStars(_controller.gameInfo.value.rating!.round()),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "224 Reviews",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.maxFinite,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: kPrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Buying Not Supported Yet")));
              },
              child: const Text(
                "BUY NOW",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStars(star) {
    const filledStar = Icon(Icons.star, size: 25, color: Colors.amber);
    const unFilledStar = Icon(Icons.star, size: 25, color: Color(0xff9b9b9b));
    return Row(
        children: List.generate(
            5, (index) => index < star ? filledStar : unFilledStar));
  }
}
