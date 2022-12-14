import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constant/constants.dart';
import 'package:netflix_clone/presentation/home/widget/home_main_card.dart';
import 'package:netflix_clone/presentation/home/widget/home_tittle.dart';
class MainTittleCard extends StatelessWidget {
  const MainTittleCard({
    Key? key,
    required this.width,
    required this.tittle,
  }) : super(key: key);

  final double width;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         HomeTittle(tittle: tittle),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => HomeChard(width: width),
            ),
          ),
        ),
      ],
    );
  }
}