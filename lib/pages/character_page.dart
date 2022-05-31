import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:rickandmorty_flutter_bloc/blocs/character_filters/character_status_filter/character_status_filter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/characters/characters_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/characters_search/characters_search_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/episodes/episodes_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/filtered_characters/filtered_characters_bloc.dart';
import 'package:rickandmorty_flutter_bloc/cubits/characters_page/characters_page_cubit.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/pages/character_details_page.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';
import 'package:rickandmorty_flutter_bloc/widgets/buttons/button_search_widget.dart';
import 'package:rickandmorty_flutter_bloc/widgets/buttons/filter_state_button.dart';
import 'package:rickandmorty_flutter_bloc/widgets/buttons/popupmenu_button_widget.dart';
import 'package:rickandmorty_flutter_bloc/widgets/cards/card_character.dart';
import 'package:rickandmorty_flutter_bloc/widgets/dialogs/error_dialog.dart';
import 'package:rickandmorty_flutter_bloc/widgets/layout/background_image.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  List<Character> _filteredCharacters({
    required FilterStatus filterStatus,
    required String searchTerm,
    required List<Character> allCharacters,
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

    if (searchTerm.isNotEmpty) {
      resultCharacters = resultCharacters
          .where((element) => element.name!.toLowerCase().contains(searchTerm))
          .toList();
    }
    return resultCharacters;
  }

  @override
  Widget build(BuildContext context) {
    final charactersFinal =
        context.watch<FilteredCharactersBloc>().state.filteredCharacters;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          //LOAD CARDS BY LAZYLOAD
          MultiBlocListener(
            listeners: [
              BlocListener<CharactersSearchBloc, CharactersSearchState>(
                listener: (context, stateCharactersSearch) {
                  final filteredCharacters = _filteredCharacters(
                    filterStatus: context
                        .read<CharacterStatusFilterBloc>()
                        .state
                        .filterStatus,
                    allCharacters:
                        context.read<CharactersBloc>().state.characters,
                    searchTerm: stateCharactersSearch.searchTerm,
                  );
                  context.read<FilteredCharactersBloc>().add(
                      CalculateFilteredCharactersEvent(
                          filteredCharacters: filteredCharacters));
                },
              ),
              BlocListener<CharacterStatusFilterBloc,
                  CharacterStatusFilterState>(
                listener: (context, state) {
                  final filteredCharacters = _filteredCharacters(
                    filterStatus: state.filterStatus,
                    allCharacters:
                        context.read<CharactersBloc>().state.characters,
                    searchTerm:
                        context.read<CharactersSearchBloc>().state.searchTerm,
                  );
                  context.read<FilteredCharactersBloc>().add(
                        CalculateFilteredCharactersEvent(
                            filteredCharacters: filteredCharacters),
                      );
                },
              ),
            ],
            child: BlocBuilder<CharactersPageCubit, CharactersPageState>(
              builder: (context, characterPageState) {
                return BlocConsumer<CharactersBloc, CharactersState>(
                  listener: (context, state) {
                    if (state.status == CharactersStatus.error) {
                      errorDialog(context, state.error.errMsg);
                    }
                    final filteredCharacters = _filteredCharacters(
                      filterStatus: context
                          .read<CharacterStatusFilterBloc>()
                          .state
                          .filterStatus,
                      allCharacters: state.characters,
                      searchTerm:
                          context.read<CharactersSearchBloc>().state.searchTerm,
                    );
                    context.read<FilteredCharactersBloc>().add(
                        CalculateFilteredCharactersEvent(
                            filteredCharacters: filteredCharacters));
                  },
                  builder: (context, state) {
                    if (state.status == CharactersStatus.initial) {
                      context.read<CharactersBloc>().add(
                          FetchCharactersEvent(page: characterPageState.page));
                    }
                    return LazyLoadScrollView(
                      onEndOfPage: () {
                        BlocProvider.of<CharactersPageCubit>(context)
                            .increment();
                        context.read<CharactersBloc>().add(FetchCharactersEvent(
                            page: characterPageState.page));
                      },
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(40),
                            child: Image.asset(
                              "assets/images/rickandmorty-letters.png",
                            ),
                          ),
                          Container(
                            color: AppColors.COLOR_BLACK_GREY,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 24),
                            child: Row(
                              children: const [
                                //FILTERS SECTION
                                ButtonSearchWidget(),
                                Spacer(),
                                PopupmenuButtonWidget()
                              ],
                            ),
                          ), //FILTERS BY CATEGORIES
                          Container(
                            color: AppColors.COLOR_WHITE,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    FilterStateButton(
                                      filterStatus: FilterStatus.all,
                                    ),
                                    FilterStateButton(
                                      filterStatus: FilterStatus.alive,
                                    ),
                                    FilterStateButton(
                                      filterStatus: FilterStatus.dead,
                                    ),
                                    FilterStateButton(
                                      filterStatus: FilterStatus.unknown,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          //SHOW CARDS
                          Container(
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
                                      context
                                          .read<EpisodesBloc>()
                                          .add(FetchEpisodesEvent(
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
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
