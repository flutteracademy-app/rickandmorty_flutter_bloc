import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_fonts.dart';

class TopDetailsCharacterWidget extends StatelessWidget {
  final Character character;
  const TopDetailsCharacterWidget({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 380,
          color: AppColors.COLOR_BLACK_GREY,
        ),
        Opacity(
          opacity: 0.6,
          child: Image.asset(
            "assets/images/other-image-rickandmorty.jpeg",
            width: double.infinity,
            height: 180,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 60,
          left: 20,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            color: AppColors.COLOR_WHITE,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 70,
                      child: CircleAvatar(
                        backgroundColor: AppColors.COLOR_WHITE,
                        radius: 55,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(character.image!),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   bottom: 0,
                    //   left: 52,
                    //   child: FavouriteButtonWidget(
                    //     character: character,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (character.status == "Alive")
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.COLOR_GREEN,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    Text(
                      character.status!,
                      style: TEXT_THEME_WHITE.subtitle1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  character.name!,
                  style: TEXT_THEME_WHITE.bodyText1,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  character.species!,
                  style: TEXT_THEME_WHITE.subtitle1,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
