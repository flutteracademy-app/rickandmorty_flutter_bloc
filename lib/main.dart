import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/characters/characters_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/episodes/episodes_bloc.dart';
import 'package:rickandmorty_flutter_bloc/cubits/characters_page/characters_page_cubit.dart';
import 'package:rickandmorty_flutter_bloc/data/repositories/character_repository.dart';
import 'package:rickandmorty_flutter_bloc/data/repositories/episode_repository.dart';
import 'package:rickandmorty_flutter_bloc/data/services/characters_api_services.dart';
import 'package:rickandmorty_flutter_bloc/data/services/episode_api_services.dart';
import 'package:rickandmorty_flutter_bloc/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: ((context) => CharacterRepository(
                rickandmortyApiServices: CharactersApiServices(),
              )),
        ),
        RepositoryProvider(
          create: ((context) => EpisodeRepository(
                episodeApiServices: EpisodeApiServices(),
              )),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CharactersBloc>(
            create: (context) => CharactersBloc(
              allCharacters: [],
              characterRepository: context.read<CharacterRepository>(),
            ),
          ),
          BlocProvider<CharactersPageCubit>(
            create: (context) => CharactersPageCubit(),
          ),
          BlocProvider<EpisodesBloc>(
            create: (context) => EpisodesBloc(
              allEpisodes: [],
              episodeRepository: context.read<EpisodeRepository>(),
            ),
          ),
        ],
        child: const MaterialApp(
          title: 'Material App',
          home: HomePage(),
        ),
      ),
    );
  }
}
