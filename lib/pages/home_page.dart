import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/pages/character_page.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_fonts.dart';
import 'package:rickandmorty_flutter_bloc/widgets/buttons/button_widget.dart';
import 'package:rickandmorty_flutter_bloc/widgets/layout/background_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //BACKGROUND IMAGE
                Image.asset(
                  "assets/images/rickandmorty-letters.png",
                ),

                //INFORMATION PAGE
                Column(
                  children: [
                    Text(
                      "Bienvenido \na Rick and Morty",
                      style: TEXT_THEME_WHITE.headline1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "En esta prueba analizaremos la capacidad de construir la app en base a sus conocimientos y habilidades de desarrollo mediante el análisis del código y la reproducción del siguiente diseño.",
                      style: TEXT_THEME_WHITE.bodyText2,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                //NAVIGATION BUTTON
                ButtonWidget(
                  text: "Continuar",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CharacterPage();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
