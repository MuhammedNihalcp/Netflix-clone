import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigatorWidget extends StatelessWidget {
  const BottomNavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (BuildContext context, int newIndex, _) {
          return BottomNavigationBar(
              currentIndex: newIndex,
              onTap: (index){
                indexChangeNotifier.value = index;
              },
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: backgroundColor,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections), label: 'New & Hot'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_emotions), label: 'Fast Laughs'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.arrow_circle_down_rounded),
                    label: 'Downloads')
              ]);
        });
  }
}
