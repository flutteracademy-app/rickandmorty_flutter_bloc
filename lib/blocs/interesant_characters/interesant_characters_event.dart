// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'interesant_characters_bloc.dart';

abstract class InteresantCharactersEvent {}

class ShowInteresantCharactersState extends InteresantCharactersEvent {
  final List<Character> interesantCharacters;
  ShowInteresantCharactersState({
    required this.interesantCharacters,
  });
}
