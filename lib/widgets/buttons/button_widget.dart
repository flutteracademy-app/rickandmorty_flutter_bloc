import 'package:flutter/material.dart';
import 'package:rickandmorty_flutter_bloc/theme/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(45, 10.0, 45, 10.0),
        child: Text(
          text,
        ),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: AppColors.COLOR_BLUE,
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          textStyle: const TextStyle(fontSize: 18)),
      onPressed: onPressed,
    );
  }
}
