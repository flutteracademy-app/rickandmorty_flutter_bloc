// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'characters_search_bloc.dart';

abstract class CharactersSearchEvent {}

class SetSearchTermsEvent extends CharactersSearchEvent {
  final String newSearchTerm;
  SetSearchTermsEvent({
    required this.newSearchTerm,
  });
}
