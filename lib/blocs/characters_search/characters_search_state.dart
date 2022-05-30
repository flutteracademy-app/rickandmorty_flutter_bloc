// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'characters_search_bloc.dart';

class CharactersSearchState {
  final String searchTerm;
  CharactersSearchState({
    required this.searchTerm,
  });

  factory CharactersSearchState.initial() {
    return CharactersSearchState(searchTerm: '');
  }

  CharactersSearchState copyWith({
    String? searchTerm,
  }) {
    return CharactersSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
