import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';

class PopupmenuButtonWidget extends StatelessWidget {
  const PopupmenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.menu,
        color: AppColors.COLOR_WHITE,
      ),
      onSelected: (String result) {},

      // (String result) {
      //   switch (result) {
      //     case 'clearFilters':
      //       characterController.genderSearchCharacter.value = '';
      //       characterController.statusSearchCharacter.value = '';
      //       characterController.clearSearchCharacters(context);
      //       characterController.clearListCharacters(context);
      //       break;
      //     default:
      //   }
      // },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'clearFilters',
          child: Text('Clear filters'),
        ),
      ],
    );
  }
}
