part of 'episodes_bloc.dart';

enum EpisodesStatus {
  initial,
  loading,
  loaded,
  error,
}

class EpisodesState {
  final EpisodesStatus status;
  final List<Episode> episodes;
  final CustomError error;
  EpisodesState({
    required this.status,
    required this.episodes,
    required this.error,
  });

  factory EpisodesState.initial() {
    return EpisodesState(
      status: EpisodesStatus.initial,
      episodes: [],
      error: CustomError(),
    );
  }

  EpisodesState copyWith({
    EpisodesStatus? status,
    List<Episode>? episodes,
    CustomError? error,
  }) {
    return EpisodesState(
      status: status ?? this.status,
      episodes: episodes ?? this.episodes,
      error: error ?? this.error,
    );
  }
}
