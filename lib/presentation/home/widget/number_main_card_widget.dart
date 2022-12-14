import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({Key? key, required this.postersList})
      : super(key: key);

  final List<String> postersList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const MainTitle(title: 'Top 10 Tv SHows In India Today'),
        LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                postersList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: NumberCard(
                    imageUrl: postersList[index],
                    index: index,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
