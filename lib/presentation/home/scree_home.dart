import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/constant/constants.dart';
import 'package:netflix_clone/presentation/home/widget/bottom_icons.dart';
import 'package:netflix_clone/presentation/home/widget/number_main_card_widget.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

import '../../application/homepage/homepage_bloc.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomepageBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: ((notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            }),
            child: Stack(
              children: [
                BlocBuilder<HomepageBloc, HomepageState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text(
                          'Error while loading',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    // release Past year
                    final releasedPastyear = state.pastYearMovieList.map((m) {
                      return "$imageAppenUrl${m.posterPath}";
                    }).toList();
                    releasedPastyear.shuffle();

                    //Trending Now
                    final trending = state.treandingNowList.map((m) {
                      return "$imageAppenUrl${m.posterPath}";
                    }).toList();
                    //Tens dramas
                    final tensDramas = state.tensDramasMovieList.map((m) {
                      return "$imageAppenUrl${m.posterPath}";
                    }).toList();
                    tensDramas.shuffle();

                    //South Indian movies
                    final southindian = state.southIndianMovieList.map((m) {
                      return "$imageAppenUrl${m.posterPath}";
                    }).toList();

                    //Top ten movies
                    final topten = state.trendingtvList.map((m) {
                      return "$imageAppenUrl${m.posterPath}";
                    }).toList();

                    return ListView(
                      children: [
                       const BackgroundCard(),
                        MainTitleCard(
                          title: 'Released in the past year',
                          posterList: releasedPastyear.sublist(0, 10),
                        ),
                        kheight,
                        MainTitleCard(
                          title: 'Trending Now',
                          posterList: trending.sublist(0, 10),
                        ),
                        kheight,
                        NumberTitleCard(
                          postersList: topten.sublist(0, 10),
                        ),
                        kheight,
                        MainTitleCard(
                          title: 'Tense Dreamas ',
                          posterList: tensDramas.sublist(0, 10),
                        ),
                        kheight,
                        MainTitleCard(
                          title: 'South indian Cinema',
                          posterList: southindian.sublist(0, 10),
                        ),
                        kheight,
                      ],
                    );
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration:const Duration(milliseconds: 1000),
                        width: double.infinity,
                        height: 120,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://cdn.vox-cdn.com/thumbor/Yq1Vd39jCBGpTUKHUhEx5FfxvmM=/39x0:3111x2048/1200x800/filters:focal(39x0:3111x2048)/cdn.vox-cdn.com/uploads/chorus_image/image/49901753/netflixlogo.0.0.png",
                                  width: 100,
                                  height: 100,
                                ),
                               const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: Colors.white,
                                ),
                                kwidth,
                                Container(
                                  width: 30,
                                  height: 30,
                                  color: Colors.blue,
                                ),
                                kwidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'TV Shows',
                                  style: khomeTitleText,
                                ),
                                Text(
                                  'Movies',
                                  style: khomeTitleText,
                                ),
                                Text(
                                  'Categories',
                                  style: khomeTitleText,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : kheight
              ],
            ),
          );
        },
      ),
    );
  }
}
