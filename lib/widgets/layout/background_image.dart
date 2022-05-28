import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Opacity(
        opacity: 0.2,
        child: Image.asset(
          "assets/images/space-image-rickandmorty.png",
          fit: BoxFit.fitHeight,
          colorBlendMode: BlendMode.modulate,
        ),
      ),
    );
  }
}
