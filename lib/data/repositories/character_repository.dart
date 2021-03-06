// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rickandmorty_flutter_bloc/data/excepcions/character_excepcions.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/data/models/custom_error.dart';
import 'package:rickandmorty_flutter_bloc/data/services/characters_api_services.dart';

class CharacterRepository {
  final CharactersApiServices rickandmortyApiServices;
  CharacterRepository({
    required this.rickandmortyApiServices,
  });

  Future<List<Character>> fetchListCharacter(
      int page, List<Character> allCharacters) async {
    try {
      final List<Character> characters =
          await rickandmortyApiServices.getCharactersPerPage(page);
      allCharacters.addAll(characters);
      return allCharacters;
    } on CharacterException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
