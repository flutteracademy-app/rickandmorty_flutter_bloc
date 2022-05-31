// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_status_filter_bloc.dart';

abstract class CharacterStatusFilterEvent {}

class ChangeCharacterStatusFilterEvent extends CharacterStatusFilterEvent {
  final FilterStatus newFilterStatus;
  ChangeCharacterStatusFilterEvent({
    required this.newFilterStatus,
  });
}
