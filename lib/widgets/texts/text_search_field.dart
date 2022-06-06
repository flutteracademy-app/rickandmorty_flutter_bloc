import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/character_filters/characters_search/characters_search_bloc.dart';

import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_fonts.dart';

class TextSearchField extends StatelessWidget {
  const TextSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return BlocConsumer<CharactersSearchBloc, CharactersSearchState>(
      listener: ((context, state) {
        if (state.searchTerm == '') {
          textEditingController.clear();
        }
      }),
      builder: (context, state) {
        return SizedBox(
          width: 200,
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              prefixIcon: (state.searchTerm == '')
                  ? const Icon(
                      Icons.search,
                      color: AppColors.COLOR_WHITE,
                    )
                  : IconButton(
                      onPressed: () {
                        textEditingController.clear();
                        context
                            .read<CharactersSearchBloc>()
                            .add(SetSearchTermsEvent(newSearchTerm: ''));
                      },
                      icon: const Icon(
                        Icons.close,
                        color: AppColors.COLOR_WHITE,
                      ),
                    ),
              hintText: "Buscar personaje...",
              border: InputBorder.none,
              hintStyle: TEXT_THEME_WHITE.bodyText2!
                  .copyWith(color: AppColors.COLOR_GREY),
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
      },
    );
  }
}
