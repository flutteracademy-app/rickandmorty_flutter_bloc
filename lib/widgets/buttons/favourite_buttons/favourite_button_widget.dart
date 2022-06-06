import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/blocs/characters/characters_bloc.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteButtonWidget extends StatelessWidget {
  final Character character;
  const FavouriteButtonWidget({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
      return GestureDetector(
        onTap: () async {
          context.read<CharactersBloc>().add(ToggleCharacterEvent(
                id: character.id!,
              ));
          SharedPreferences prefs = await SharedPreferences.getInstance();

          print(state.characters);

          await prefs.setString(
              "favouritesCharacters", jsonEncode(state.characters));
        },
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.COLOR_LIGHT_GREY,
            shape: BoxShape.circle,
          ),
          height: 36,
          width: 36,
          child: Icon(
            Icons.star,
            size: 20,
            color: (character.isFavourite == true)
                ? AppColors.COLOR_YELLOW
                : AppColors.COLOR_WHITE,
          ),
        ),
      );
    });
  }
}
