import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/blocs/character_filters/character_status_filter/character_status_filter_bloc.dart';
import 'package:rickandmorty_flutter_bloc/data/models/character_model.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';

class FilterStateButton extends StatelessWidget {
  final FilterStatus filterStatus;
  const FilterStateButton({Key? key, required this.filterStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CharacterStatusFilterBloc>().add(
            ChangeCharacterStatusFilterEvent(newFilterStatus: filterStatus));
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          textColor(context, filterStatus),
        ),
      ),
      child: Text(
        filterStatus == FilterStatus.all
            ? 'Todos'
            : filterStatus == FilterStatus.alive
                ? 'Alive'
                : filterStatus == FilterStatus.dead
                    ? 'Dead'
                    : 'Unknown',
      ),
    );
  }

  Color textColor(BuildContext context, FilterStatus filterStatus) {
    final currentFilter =
        context.watch<CharacterStatusFilterBloc>().state.filterStatus;
    return currentFilter == filterStatus
        ? AppColors.COLOR_BLUE
        : AppColors.COLOR_GREY;
  }
}
