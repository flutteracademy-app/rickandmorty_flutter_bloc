// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filtered_characters_bloc.dart';

class FilteredCharactersState {
  final List<Character> filteredCharacters;
  FilteredCharactersState({
    required this.filteredCharacters,
  });

  factory FilteredCharactersState.initial() {
    return FilteredCharactersState(filteredCharacters: []);
  }

  FilteredCharactersState copyWith({List<Character>? filteredCharacters}) {
    return FilteredCharactersState(
      filteredCharacters: filteredCharacters ?? this.filteredCharacters,
    );
  }
}
