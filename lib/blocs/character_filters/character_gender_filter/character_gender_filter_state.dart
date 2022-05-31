// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_gender_filter_bloc.dart';

class CharacterGenderFilterState {
  final FilterGender filterGender;
  CharacterGenderFilterState({
    required this.filterGender,
  });

  factory CharacterGenderFilterState.initial() {
    return CharacterGenderFilterState(filterGender: FilterGender.all);
  }

  CharacterGenderFilterState copyWith({FilterGender? filterGender}) {
    return CharacterGenderFilterState(
        filterGender: filterGender ?? this.filterGender);
  }
}
