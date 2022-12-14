import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/constant/constants.dart';
import 'package:netflix_clone/presentation/serch/widget/search_tittle.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';

import '../../../application/search/search_bloc.dart';

const imageResultUrl =
    'https://www.google.com/imgres?imgurl=https%3A%2F%2Fc8.alamy.com%2Fcomp%2FBGMMYM%2Favatar-year-2009-director-james-cameron-movie-poster-usa-BGMMYM.jpg&imgrefurl=https%3A%2F%2Fwww.alamy.com%2Fstock-photo%2Fmovie-poster.html&tbnid=M9mnz77KsV-agM&vet=12ahUKEwju4tmksLD7AhUIyaACHRgiBZMQMygAegUIARDlAQ..i&docid=PybT_wqEQ2qkNM&w=880&h=1390&q=movie%20poster%20image&ved=2ahUKEwju4tmksLD7AhUIyaACHRgiBZMQMygAegUIARDlAQ';

class SearchresultWidget extends StatelessWidget {
  const SearchresultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(title: 'Movies & TV '),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.5,
                  children: List.generate(20, (index) {
                    final movie = state.searchResultList[index];
                    return MainCard(
                      imageUrl: movie.posterImageUrl,
                    );
                  }));
            },
          ),
        )
      ],
    );
  }
}
