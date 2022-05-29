import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/data/models/episode_model.dart';
import 'package:rickandmorty_flutter_bloc/widgets/cards/card_information_episode.dart';

class LoadEpisodesWidget extends StatelessWidget {
  final List<Episode> episodes;
  const LoadEpisodesWidget({Key? key, required this.episodes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: episodes.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.4,
          ),
          itemBuilder: (context, index) {
            return CardInformationEpisode(
              title: episodes[index].name!,
              description: episodes[index].episode!,
              date: episodes[index].airDate!,
            );
          },
        ),
      ],
    );
  }
}
