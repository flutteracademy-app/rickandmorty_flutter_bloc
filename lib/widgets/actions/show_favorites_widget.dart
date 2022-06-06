import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_fonts.dart';
import 'package:rickandmorty_flutter_bloc/widgets/buttons/favourite_buttons/list_favourite_button_widget.dart';

class ShowFavouritesWidget extends StatelessWidget {
  const ShowFavouritesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: AppColors.COLOR_WHITE,
      child: Row(
        children: [
          Text(
            "Mostrar favoritos:",
            style: TEXT_THEME_BLACK.headline1,
          ),
          const SizedBox(
            width: 10,
          ),
          const ListFavouriteButton()
        ],
      ),
    );
  }
}
