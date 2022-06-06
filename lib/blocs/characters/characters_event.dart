// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent {}

class FetchCharactersEvent extends CharactersEvent {
  final int page;
  FetchCharactersEvent({
    required this.page,
  });
}

class ToggleCharacterEvent extends CharactersEvent {
  final int id;
  ToggleCharacterEvent({
    required this.id,
  });
}
