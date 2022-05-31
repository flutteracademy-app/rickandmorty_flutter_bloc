import 'package:bloc/bloc.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';

part 'character_status_filter_event.dart';
part 'character_status_filter_state.dart';

class CharacterStatusFilterBloc
    extends Bloc<CharacterStatusFilterEvent, CharacterStatusFilterState> {
  CharacterStatusFilterBloc() : super(CharacterStatusFilterState.initial()) {
    on<ChangeCharacterStatusFilterEvent>((event, emit) {
      emit(state.copyWith(filterStatus: event.newFilterStatus));
    });
  }
}
