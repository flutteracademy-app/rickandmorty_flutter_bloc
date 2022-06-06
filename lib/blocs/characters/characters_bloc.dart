// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/data/models/custom_error.dart';
import 'package:rickandmorty_flutter_bloc/data/repositories/character_repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository characterRepository;
  final List<Character> allCharacters;
  CharactersBloc({
    required this.characterRepository,
    required this.allCharacters,
  }) : super(CharactersState.initial()) {
    on<FetchCharactersEvent>(_fetchCharacters);
    on<ToggleCharacterEvent>(_toggleCharacters);
  }

  FutureOr<void> _fetchCharacters(
    FetchCharactersEvent event,
    Emitter<CharactersState> emit,
  ) async {
    emit(state.copyWith(status: CharactersStatus.loading));

    try {
      final List<Character> characters =
          await characterRepository.fetchListCharacter(
        event.page,
        allCharacters,
      );
      emit(state.copyWith(
          status: CharactersStatus.loaded, characters: characters));
    } on CustomError catch (e) {
      emit(state.copyWith(status: CharactersStatus.error, error: e));
    }
  }

  void _toggleCharacters(
    ToggleCharacterEvent event,
    Emitter<CharactersState> emit,
  ) {
    final newCharacters = state.characters.map((Character character) {
      if (character.id == event.id) {
        character.isFavourite ??= false;
        character.isFavourite = !character.isFavourite;
        print(character.isFavourite);
        return character;
      }
      return character;
    }).toList();
    emit(state.copyWith(characters: newCharacters));
  }
}
