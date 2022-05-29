import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/data/models/custom_error.dart';
import 'package:rickandmorty_flutter_bloc/data/models/episode_model.dart';
import 'package:rickandmorty_flutter_bloc/data/repositories/episode_repository.dart';

part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  final EpisodeRepository episodeRepository;
  final List<Episode> allEpisodes;
  EpisodesBloc({
    required this.episodeRepository,
    required this.allEpisodes,
  }) : super(EpisodesState.initial()) {
    on<FetchEpisodesEvent>(_fetchEpisodes);
  }

  FutureOr<void> _fetchEpisodes(
    FetchEpisodesEvent event,
    Emitter<EpisodesState> emit,
  ) async {
    emit(state.copyWith(status: EpisodesStatus.loading));
    try {
      final List<Episode> episodes = await episodeRepository.fetchListEpisodes(
        character: event.character,
        allEpisodes: allEpisodes,
      );

      emit(state.copyWith(status: EpisodesStatus.loaded, episodes: episodes));
    } on CustomError catch (e) {
      emit(state.copyWith(status: EpisodesStatus.error, error: e));
    }
  }
}
