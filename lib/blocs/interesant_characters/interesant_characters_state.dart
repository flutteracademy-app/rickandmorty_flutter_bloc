// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'interesant_characters_bloc.dart';

class InteresantCharactersState {
  final List<Character> interesantCharacters;
  InteresantCharactersState({
    required this.interesantCharacters,
  });

  factory InteresantCharactersState.initial() {
    return InteresantCharactersState(interesantCharacters: []);
  }

  InteresantCharactersState copyWith({List<Character>? interesantCharacters}) {
    return InteresantCharactersState(
      interesantCharacters: interesantCharacters ?? this.interesantCharacters,
    );
  }
}
