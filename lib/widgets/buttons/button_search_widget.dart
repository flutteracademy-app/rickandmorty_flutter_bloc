import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/widgets/texts/text_search_field.dart';

class ButtonSearchWidget extends StatelessWidget {
  const ButtonSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          TextSearchField(),
        ],
      ),
    );
  }
}
