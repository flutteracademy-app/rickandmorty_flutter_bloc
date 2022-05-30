import 'package:bloc/bloc.dart';
part 'characters_search_event.dart';
part 'characters_search_state.dart';

class CharactersSearchBloc
    extends Bloc<CharactersSearchEvent, CharactersSearchState> {
  CharactersSearchBloc() : super(CharactersSearchState.initial()) {
    on<SetSearchTermsEvent>((event, emit) {
      emit(state.copyWith(searchTerm: event.newSearchTerm));
    });
  }
}
