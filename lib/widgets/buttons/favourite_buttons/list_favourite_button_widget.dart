import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/cubits/show_favourites/show_favourites_cubit.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';

class ListFavouriteButton extends StatelessWidget {
  const ListFavouriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () async {
      BlocProvider.of<ShowFavouritesCubit>(context).toggleSelection();
    }, child: BlocBuilder<ShowFavouritesCubit, ShowFavouritesState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.COLOR_LIGHT_GREY,
            shape: BoxShape.circle,
          ),
          height: 36,
          width: 36,
          child: Icon(
            Icons.star,
            size: 20,
            color: (state.isSelected == true)
                ? AppColors.COLOR_YELLOW
                : AppColors.COLOR_WHITE,
          ),
        );
      },
    ));
  }
}
