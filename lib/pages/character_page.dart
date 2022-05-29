import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/characters/characters_bloc.dart';
import 'package:rickandmorty_flutter_bloc/widgets/cards/card_character.dart';
import 'package:rickandmorty_flutter_bloc/widgets/dialogs/error_dialog.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<CharactersBloc>().add(FetchCharactersEvent(page: 1));
      }),
      body: BlocConsumer<CharactersBloc, CharactersState>(
        listener: (context, state) {
          if (state.status == CharactersStatus.error) {
            errorDialog(context, state.error.errMsg);
          }
        },
        builder: (context, state) {
          if (state.status == CharactersStatus.initial) {
            return const Center(
              child: Text(
                'Página Inicial',
                style: TextStyle(fontSize: 20.0),
              ),
            );
          }
          if (state.status == CharactersStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == CharactersStatus.error) {
            return const Center(
              child: Text(
                'Página vacia',
                style: TextStyle(fontSize: 20.0),
              ),
            );
          }

          return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                return CardCharacter(
                  character: state.characters[index],
                  onTap: () {},
                );
              });
        },
      ),
    );
  }
}
