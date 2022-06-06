import 'package:bloc/bloc.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';

part 'interesant_characters_event.dart';
part 'interesant_characters_state.dart';

class InteresantCharactersBloc
    extends Bloc<InteresantCharactersEvent, InteresantCharactersState> {
  final List<Character> initialCharacters;
  InteresantCharactersBloc({
    required this.initialCharacters,
  }) : super(InteresantCharactersState(
            interesantCharacters: initialCharacters)) {
    on<ShowInteresantCharactersState>((event, emit) {
      emit(state.copyWith(interesantCharacters: event.interesantCharacters));
    });
  }
}
