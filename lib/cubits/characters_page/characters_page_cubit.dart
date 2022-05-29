import 'package:bloc/bloc.dart';

part 'characters_page_state.dart';

class CharactersPageCubit extends Cubit<CharactersPageState> {
  CharactersPageCubit() : super(CharactersPageState.initial());

  void increment() {
    final newState = state.copyWith(page: state.page + 1);
    emit(newState);
  }
}
