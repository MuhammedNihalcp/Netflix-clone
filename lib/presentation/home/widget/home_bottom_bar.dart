import 'package:flutter/material.dart';

import '../../../core/constant/constants.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      width: double.infinity,
      height: height * 0.18,
      color: Colors.black.withOpacity(0.3),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/image/netflix-logo-png.png',
                  width: 70,
                  height: 70,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.cast,
                      color: Colors.white,
                      size: 30,
                    )),
                kwidth,
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
                kwidth
              ],
            ),
          ),
          kheight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                'TV Shows',
                style: homeTopTextStyle,
              ),
              Text(
                'Movies',
                style: homeTopTextStyle,
              ),
              Text(
                'Categories',
                style: homeTopTextStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}
