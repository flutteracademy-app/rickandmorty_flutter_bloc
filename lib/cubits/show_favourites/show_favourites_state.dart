// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'show_favourites_cubit.dart';

class ShowFavouritesState {
  final bool isSelected;
  ShowFavouritesState({
    required this.isSelected,
  });

  factory ShowFavouritesState.initial() {
    return ShowFavouritesState(isSelected: false);
  }

  ShowFavouritesState copyWith({bool? isSelected}) {
    return ShowFavouritesState(
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
