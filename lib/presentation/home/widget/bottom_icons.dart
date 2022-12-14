import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constant/constants.dart';
import 'package:netflix_clone/presentation/home/widget/icon_button.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height * 0.85,
          decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage(kMainImage),fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                _playbutton(),
                const CustomButtonWidget(icon: Icons.info, title: 'info')
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playbutton() {
    return TextButton.icon(
      onPressed: () {},
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhiteColor)),
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kblackbutton,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: kblackbutton),
        ),
      ),
    );
  }
}