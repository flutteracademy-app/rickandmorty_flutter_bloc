import 'package:bloc/bloc.dart';

part 'show_favourites_state.dart';

class ShowFavouritesCubit extends Cubit<ShowFavouritesState> {
  ShowFavouritesCubit() : super(ShowFavouritesState.initial());

  void toggleSelection() {
    final newState = state.copyWith(isSelected: !state.isSelected);
    emit(newState);
  }

  void clearSelection() {
    final newState = state.copyWith(isSelected: false);
    emit(newState);
  }
}
