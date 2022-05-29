// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'characters_page_cubit.dart';

class CharactersPageState {
  final int page;
  CharactersPageState({
    required this.page,
  });

  factory CharactersPageState.initial() {
    return CharactersPageState(page: 1);
  }

  CharactersPageState copyWith({
    int? page,
  }) {
    return CharactersPageState(
      page: page ?? this.page,
    );
  }
}
