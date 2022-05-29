import 'package:bloc/bloc.dart';

part 'episodes_number_state.dart';

class EpisodesNumberCubit extends Cubit<EpisodesNumberState> {
  EpisodesNumberCubit() : super(EpisodesNumberState.initial());

  void increment() {
    final newState = state.copyWith(number: state.number + 4);
    emit(newState);
  }

  void clearNumbers() {
    final newState = state.copyWith(number: 4);
    emit(newState);
  }
}
