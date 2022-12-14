import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constant/constants.dart';
import 'package:netflix_clone/presentation/serch/widget/search_tittle.dart';

import '../../../application/search/search_bloc.dart';

const imageUrl =
    'https://www.google.com/imgres?imgurl=http%3A%2F%2Fwww.impawards.com%2F2021%2Fposters%2Fgodzilla_vs_kong_ver19_xxlg.jpg&imgrefurl=http%3A%2F%2Fwww.impawards.com%2F2021%2Fgodzilla_vs_kong_ver19_xxlg.html&tbnid=M7x5KENGSptCSM&vet=12ahUKEwjAlpvHhLH7AhUFgGMGHdjqB-0QMygfegUIARC4Ag..i&docid=yP2NQmELqW2M2M&w=2500&h=1157&q=movie%20poster%20image%20horizontal&ved=2ahUKEwjAlpvHhLH7AhUFgGMGHdjqB-0QMygfegUIARC4Ag';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const SearchTitle(title: 'Top Searches'),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text('No results found'),
                );
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.idleList.length,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return TopSearchitems(
                        title: movie.title ?? 'No title Provided',
                        imageUrl: '$imageAppenUrl${movie.posterPath}');
                  });
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchitems extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchitems({Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
            width: screenwidth * 0.35,
            height: 65,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl)),
            )),
        const SizedBox(width: 6),
        Expanded(
            flex: 3,
            child: Text(title,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  //   overflow: TextOverflow.ellipsis,
                ))),
        const Spacer(),
        const Icon(
          CupertinoIcons.play_circle,
          size: 40,
          color: kwhiteColor,
        ),
      ],
    );
  }
}
