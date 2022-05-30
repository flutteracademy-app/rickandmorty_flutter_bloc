import 'package:bloc/bloc.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';

part 'filtered_characters_event.dart';
part 'filtered_characters_state.dart';

class FilteredCharactersBloc
    extends Bloc<FilteredCharactersEvent, FilteredCharactersState> {
  final List<Character> initialCharacters;
  FilteredCharactersBloc({
    required this.initialCharacters,
  }) : super(FilteredCharactersState(filteredCharacters: initialCharacters)) {
    on<CalculateFilteredCharactersEvent>((event, emit) {
      emit(state.copyWith(filteredCharacters: event.filteredCharacters));
    });
  }
}
