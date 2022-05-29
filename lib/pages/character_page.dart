import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:rickandmorty_flutter_bloc/blocs/characters/characters_bloc.dart';
import 'package:rickandmorty_flutter_bloc/cubits/characters_page/characters_page_cubit.dart';
import 'package:rickandmorty_flutter_bloc/widgets/cards/card_character.dart';
import 'package:rickandmorty_flutter_bloc/widgets/dialogs/error_dialog.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CharactersPageCubit, CharactersPageState>(
        builder: (context, characterPageState) {
          return BlocConsumer<CharactersBloc, CharactersState>(
            listener: (context, state) {
              if (state.status == CharactersStatus.error) {
                errorDialog(context, state.error.errMsg);
              }
            },
            builder: (context, state) {
              if (state.status == CharactersStatus.initial) {
                context
                    .read<CharactersBloc>()
                    .add(FetchCharactersEvent(page: characterPageState.page));
              }

              if (state.status == CharactersStatus.error) {
                return const Center(
                  child: Text(
                    'Página vacia',
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
              }

              return LazyLoadScrollView(
                onEndOfPage: () {
                  BlocProvider.of<CharactersPageCubit>(context).increment();
                  context
                      .read<CharactersBloc>()
                      .add(FetchCharactersEvent(page: characterPageState.page));
                },
                child: ListView.builder(
                    itemCount: state.characters.length,
                    itemBuilder: (context, index) {
                      return CardCharacter(
                        character: state.characters[index],
                        onTap: () {},
                      );
                    }),
              );
            },
          );
        },
      ),
    );
  }
}
