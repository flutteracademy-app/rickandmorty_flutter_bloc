import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/cubits/episodes_number/episodes_number_cubit.dart';
import 'package:rickandmorty_flutter_bloc/data/models/episode_model.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_fonts.dart';
import 'package:rickandmorty_flutter_bloc/widgets/cards/card_information_episode.dart';

class LoadEpisodesWidget extends StatelessWidget {
  final List<Episode> episodes;
  const LoadEpisodesWidget({Key? key, required this.episodes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodesNumberCubit, EpisodesNumberState>(
        builder: (context, state) {
      return ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: (episodes.length > state.number)
                ? state.number
                : episodes.length,
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
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 30),
            child: Center(
              child: (episodes.length > state.number)
                  ? GestureDetector(
                      onTap: () {
                        BlocProvider.of<EpisodesNumberCubit>(context)
                            .increment();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Ver mas",
                          style: TEXT_THEME_BLACK.button,
                        ),
                      ),
                    )
                  : Container(),
            ),
          )
        ],
      );
    });
  }
}
