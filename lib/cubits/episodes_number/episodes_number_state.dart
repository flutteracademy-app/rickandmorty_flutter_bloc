// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'episodes_number_cubit.dart';

class EpisodesNumberState {
  final int number;
  EpisodesNumberState({
    required this.number,
  });
  factory EpisodesNumberState.initial() {
    return EpisodesNumberState(number: 4);
  }

  EpisodesNumberState copyWith({int? number}) {
    return EpisodesNumberState(
      number: number ?? this.number,
    );
  }
}
