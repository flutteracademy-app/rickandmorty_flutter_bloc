// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'characters_bloc.dart';

enum CharactersStatus {
  initial,
  loading,
  loaded,
  error,
}

class CharactersState {
  final CharactersStatus status;
  final List<Character> characters;
  final CustomError error;
  CharactersState({
    required this.status,
    required this.characters,
    required this.error,
  });

  factory CharactersState.initial() {
    return CharactersState(
      status: CharactersStatus.initial,
      characters: [],
      error: CustomError(),
    );
  }

  CharactersState copyWith({
    CharactersStatus? status,
    List<Character>? characters,
    CustomError? error,
  }) {
    return CharactersState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      error: error ?? this.error,
    );
  }
}
