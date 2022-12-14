import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/downloads/screen_download.dart';
import 'package:netflix_clone/presentation/fast_laughs/fast_laughs.dart';
import 'package:netflix_clone/presentation/home/scree_home.dart';
import 'package:netflix_clone/presentation/main_page/widget/bottom_nav.dart';
import 'package:netflix_clone/presentation/new_and_hot/new_and_hot.dart';
import 'package:netflix_clone/presentation/serch/screen_search.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});
  final pages = [
    const ScreenHome(),
    const ScreenNewhot(),
    const ScreenFastLaugh(),
     ScreenSearch(),
     ScreenDownload()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigatorWidget(),
    );
  }
}
