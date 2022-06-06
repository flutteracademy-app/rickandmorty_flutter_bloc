import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/characters/characters_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/episodes/episodes_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/interesant_characters/interesant_characters_bloc.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/pages/character_details_page.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';
import 'package:rickandmorty_flutter_bloc/widgets/cards/card_character.dart';

class LoadInteresantCharactersWidget extends StatelessWidget {
  const LoadInteresantCharactersWidget({Key? key}) : super(key: key);

  List<Character> _interesantCharacters({
    required List<Character> allCharacters,
  }) {
    List<Character> resultCharacters = allCharacters.getRange(0, 3).toList();
    return resultCharacters;
  }

  @override
  Widget build(BuildContext context) {
    final charactersFinal = _interesantCharacters(
        allCharacters: context.read<CharactersBloc>().state.characters);
    context.read<InteresantCharactersBloc>().add(
          ShowInteresantCharactersState(interesantCharacters: charactersFinal),
        );

    return Container(
      color: AppColors.COLOR_WHITE,
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 15,
        bottom: 60,
      ),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: charactersFinal.length,
          itemBuilder: (context, index) {
            return CardCharacter(
              character: charactersFinal[index],
              onTap: () {
                context.read<EpisodesBloc>().add(FetchEpisodesEvent(
                      character: charactersFinal[index],
                    ));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CharacterDetailsPage(
                        character: charactersFinal[index],
                      );
                    },
                  ),
                );
              },
            );
          }),
    );
  }
}
