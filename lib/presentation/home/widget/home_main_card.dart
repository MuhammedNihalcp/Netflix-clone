import 'package:flutter/material.dart';

import '../../serch/widget/search_idle.dart';

class HomeChard extends StatelessWidget {
  const HomeChard({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.3 ,
      height: width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
            image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
    );
  }
}