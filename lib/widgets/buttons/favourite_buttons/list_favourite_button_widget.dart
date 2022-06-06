import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';

class ListFavouriteButton extends StatelessWidget {
  const ListFavouriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.COLOR_LIGHT_GREY,
          shape: BoxShape.circle,
        ),
        height: 36,
        width: 36,
        child: const Icon(Icons.star, size: 20, color: AppColors.COLOR_WHITE
            // ? Colors.yellow
            // : Colors.white,
            ),
      ),
    );
  }
}
