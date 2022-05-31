import 'package:bloc/bloc.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';

part 'character_gender_filter_event.dart';
part 'character_gender_filter_state.dart';

class CharacterGenderFilterBloc
    extends Bloc<CharacterGenderFilterEvent, CharacterGenderFilterState> {
  CharacterGenderFilterBloc() : super(CharacterGenderFilterState.initial()) {
    on<ChangeCharacterGenderFilterEvent>((event, emit) {
      emit(state.copyWith(filterGender: event.newFilterGender));
    });
  }
}
