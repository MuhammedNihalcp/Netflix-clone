import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:bordered_text/bordered_text.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index, required this.imageUrl})
      : super(key: key);
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
           const SizedBox(
              height: 200,
              width: 40,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -10,
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: kwhiteColor,
            child: Text(
              '${index + 1}',
              style:const TextStyle(
                  fontSize: 140,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
