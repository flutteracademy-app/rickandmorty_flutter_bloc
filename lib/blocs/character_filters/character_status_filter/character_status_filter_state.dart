// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'character_status_filter_bloc.dart';

class CharacterStatusFilterState {
  final FilterStatus filterStatus;
  CharacterStatusFilterState({
    required this.filterStatus,
  });

  factory CharacterStatusFilterState.initial() {
    return CharacterStatusFilterState(filterStatus: FilterStatus.all);
  }

  CharacterStatusFilterState copyWith({FilterStatus? filterStatus}) {
    return CharacterStatusFilterState(
      filterStatus: filterStatus ?? this.filterStatus,
    );
  }
}
