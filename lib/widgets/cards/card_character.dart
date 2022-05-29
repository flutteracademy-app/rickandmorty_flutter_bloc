import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/widgets/texts/text_character_card.dart';

class CardCharacter extends StatelessWidget {
  final Character character;
  final Function() onTap;
  const CardCharacter({
    Key? key,
    required this.character,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Stack(
                children: [
                  Image.network(
                    character.image!,
                    width: 154,
                    height: 154,
                    fit: BoxFit.fill,
                  ),
                  // Positioned(
                  //   bottom: 10,
                  //   right: 10,
                  //   child: FavouriteButtonWidget(
                  //     character: character,
                  //   ),
                  // )
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCharacterCard(
                    title: character.status! + " - " + character.species!,
                    subtitle: character.name!,
                    status: character.status!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextCharacterCard(
                    title: "Last Know location:",
                    subtitle: character.location!.name!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextCharacterCard(
                    title: "First seen in:",
                    subtitle: character.origin!.name!,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
