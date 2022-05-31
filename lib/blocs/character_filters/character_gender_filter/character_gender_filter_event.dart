// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_gender_filter_bloc.dart';

abstract class CharacterGenderFilterEvent {}

class ChangeCharacterGenderFilterEvent extends CharacterGenderFilterEvent {
  final FilterGender newFilterGender;
  ChangeCharacterGenderFilterEvent({
    required this.newFilterGender,
  });
}
