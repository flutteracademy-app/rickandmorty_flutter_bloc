import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_fonts.dart';

class CardInformationCharacter extends StatelessWidget {
  final String title;
  final String description;
  const CardInformationCharacter({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.COLOR_GREY),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.info,
                size: 16,
                color: AppColors.COLOR_GREY,
              ),
              const SizedBox(
                width: 5,
              ),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: TEXT_THEME_BLACK.subtitle2,
                  text: title,
                ),
              ),
            ],
          ),
          RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TEXT_THEME_BLACK.bodyText1,
              text: description,
            ),
          ),
        ],
      ),
    );
  }
}
