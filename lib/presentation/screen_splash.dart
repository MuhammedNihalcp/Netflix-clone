import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/main_page/main_screen.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    goToScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kblackColor,
      body: Center(
        child: Image(
          image: const AssetImage('assets/image/netflix-logo-png.png'),
          width: width * 0.35,
          height: height * 0.15,
        ),
      ),
    );
  }

  Future<void> goToScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) {
      return;
    }
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenMain()));
  }
}
