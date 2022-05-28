import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_fonts.dart';

class TextCharacterCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? status;
  const TextCharacterCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (status == "Alive")
                Flexible(
                  child: Padding(
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
                ),
              Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: TEXT_THEME_BLACK.subtitle2,
                    text: title,
                  ),
                ),
              ),
            ],
          ),
          RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TEXT_THEME_BLACK.bodyText1,
              text: subtitle,
            ),
          ),
        ],
      ),
    );
  }
}
