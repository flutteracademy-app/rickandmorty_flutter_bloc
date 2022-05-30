// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filtered_characters_bloc.dart';

abstract class FilteredCharactersEvent {}

class CalculateFilteredCharactersEvent extends FilteredCharactersEvent {
  final List<Character> filteredCharacters;
  CalculateFilteredCharactersEvent({
    required this.filteredCharacters,
  });
}
