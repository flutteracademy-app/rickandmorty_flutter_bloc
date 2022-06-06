import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/character_filters/character_gender_filter/character_gender_filter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/character_filters/character_status_filter/character_status_filter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/character_filters/characters_search/characters_search_bloc.dart';
import 'package:rickandmorty_flutter_bloc/cubits/show_favourites/show_favourites_cubit.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';

class PopupmenuButtonWidget extends StatelessWidget {
  const PopupmenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.menu,
        color: AppColors.COLOR_WHITE,
      ),
      onSelected: (String result) {
        context.read<CharacterStatusFilterBloc>().add(
            ChangeCharacterStatusFilterEvent(
                newFilterStatus: FilterStatus.all));
        context.read<CharacterGenderFilterBloc>().add(
            ChangeCharacterGenderFilterEvent(
                newFilterGender: FilterGender.all));
        context
            .read<CharactersSearchBloc>()
            .add(SetSearchTermsEvent(newSearchTerm: ''));
        context.read<ShowFavouritesCubit>().clearSelection();
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'clearFilters',
          child: Text('Clear filters'),
        ),
      ],
    );
  }
}
