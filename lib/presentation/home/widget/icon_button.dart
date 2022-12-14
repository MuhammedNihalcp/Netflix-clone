import 'package:flutter/material.dart';

import 'package:netflix_clone/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.iconSize = 30,
    this.textSize = 18,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize),
        ),
      ],
    );
  }
}
