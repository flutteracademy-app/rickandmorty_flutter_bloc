import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';

class CharacterUtils {
  List<Character> filteredCharacters({
    required FilterStatus filterStatus,
    required FilterGender filterGender,
    required String searchTerm,
    required List<Character> allCharacters,
    required bool isSelected,
  }) {
    List<Character> resultCharacters;
    switch (filterStatus) {
      case FilterStatus.alive:
        resultCharacters = allCharacters
            .where((element) => element.status == 'Alive')
            .toList();
        break;
      case FilterStatus.dead:
        resultCharacters =
            allCharacters.where((element) => element.status == 'Dead').toList();
        break;
      case FilterStatus.unknown:
        resultCharacters = allCharacters
            .where((element) => element.status == 'unknown')
            .toList();
        break;
      case FilterStatus.all:
        resultCharacters = allCharacters;
        break;
    }

    switch (filterGender) {
      case FilterGender.male:
        resultCharacters = resultCharacters
            .where((element) => element.gender == 'Male')
            .toList();
        break;
      case FilterGender.female:
        resultCharacters = resultCharacters
            .where((element) => element.gender == 'Female')
            .toList();
        break;
      case FilterGender.genderless:
        resultCharacters = resultCharacters
            .where((element) => element.gender == 'Genderless')
            .toList();
        break;
      case FilterGender.unknown:
        resultCharacters = resultCharacters
            .where((element) => element.gender == 'unknown')
            .toList();
        break;
      case FilterGender.all:
        resultCharacters = resultCharacters;
        break;
    }

    if (searchTerm.isNotEmpty) {
      resultCharacters = resultCharacters
          .where((element) => element.name!.toLowerCase().contains(searchTerm))
          .toList();
    }

    if (isSelected == true) {
      resultCharacters = resultCharacters
          .where((element) => element.isFavourite == true)
          .toList();
    }
    return resultCharacters;
  }
}
