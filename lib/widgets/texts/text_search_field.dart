import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/characters_search/characters_search_bloc.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_fonts.dart';

class TextSearchField extends StatelessWidget {
  const TextSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.COLOR_WHITE,
          ),
          hintText: "Buscar personaje...",
          border: InputBorder.none,
          hintStyle:
              TEXT_THEME_WHITE.bodyText2!.copyWith(color: AppColors.COLOR_GREY),
        ),
        style: TEXT_THEME_WHITE.bodyText2,
        onChanged: (String? newSearchTerm) {
          if (newSearchTerm != null) {
            context
                .read<CharactersSearchBloc>()
                .add(SetSearchTermsEvent(newSearchTerm: newSearchTerm));
          }
        },
      ),
    );
  }
}
