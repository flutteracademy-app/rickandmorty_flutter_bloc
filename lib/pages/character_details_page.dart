import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_fonts.dart';
import 'package:rickandmorty_flutter_bloc/widgets/buttons/button_widget.dart';
import 'package:rickandmorty_flutter_bloc/widgets/cards/card_information_character.dart';
import 'package:rickandmorty_flutter_bloc/widgets/layout/background_image.dart';
import 'package:rickandmorty_flutter_bloc/widgets/layout/top_details_character_widget.dart';
import 'package:share_plus/share_plus.dart';

class CharacterDetailsPage extends StatelessWidget {
  final Character character;
  const CharacterDetailsPage({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          ListView(
            padding: EdgeInsets.zero,
            children: [
              TopDetailsCharacterWidget(
                character: character,
              ),
              //DETAILS CHARACTER
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 40.0,
                ),
                color: AppColors.COLOR_WHITE,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //INFORMATION SECTION
                    Text(
                      "Informacion",
                      style: TEXT_THEME_BLACK.headline2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        CardInformationCharacter(
                          title: "Gender:",
                          description: character.gender!,
                        ),
                        CardInformationCharacter(
                          title: "Origin",
                          description: character.origin!.name!,
                        ),
                        CardInformationCharacter(
                          title: "Type",
                          description: character.status!,
                        ),
                      ],
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.9,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //EPISODES SECTION
                    Text(
                      "Episodios",
                      style: TEXT_THEME_BLACK.headline2,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 20.0),
                    //   child: LoadEpisodesWidget(
                    //     character: character,
                    //   ),
                    // ),
                    //INTERESANT CHARACTERS SECTION
                    Text(
                      "Personajes interesantes",
                      style: TEXT_THEME_BLACK.headline2,
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 20.0),
                    //   child: LoadInteresantCharacter(),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: ButtonWidget(
                          text: "Compartir personaje",
                          onPressed: () {
                            Share.share(
                                'Mira mi pagina https://flutteracademy.app/');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
