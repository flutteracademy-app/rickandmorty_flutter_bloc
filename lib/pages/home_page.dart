import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/data/providers/character_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CharacterProvider().getCharacters();
        },
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
