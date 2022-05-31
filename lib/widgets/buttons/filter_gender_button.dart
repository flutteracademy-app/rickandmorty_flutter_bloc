import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/character_filters/character_gender_filter/character_gender_filter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';

class FilterGenderButton extends StatelessWidget {
  final FilterGender filterGender;
  const FilterGenderButton({Key? key, required this.filterGender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CharacterGenderFilterBloc>().add(
            ChangeCharacterGenderFilterEvent(newFilterGender: filterGender));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          textColor(context, filterGender),
        ),
      ),
      child: Text(
        filterGender == FilterGender.all
            ? 'Todos'
            : filterGender == FilterGender.female
                ? 'Female'
                : filterGender == FilterGender.male
                    ? 'Male'
                    : filterGender == FilterGender.genderless
                        ? 'Genderless'
                        : 'Unknown',
      ),
    );
  }

  Color textColor(BuildContext context, FilterGender filterGender) {
    final currentFilter =
        context.watch<CharacterGenderFilterBloc>().state.filterGender;
    return currentFilter == filterGender
        ? AppColors.COLOR_BLUE
        : AppColors.COLOR_GREY;
  }
}
