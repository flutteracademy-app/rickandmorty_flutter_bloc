// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'episodes_bloc.dart';

@immutable
abstract class EpisodesEvent {}

class FetchEpisodesEvent extends EpisodesEvent {
  final Character character;
  FetchEpisodesEvent({
    required this.character,
  });
}
