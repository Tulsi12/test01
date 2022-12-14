import 'package:flutter/material.dart';
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key, required this.imgPath,
  }) : super(key: key);
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [Colors.black, Colors.transparent]).createShader(rect),
      blendMode: BlendMode.darken,
      child: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgPath),
              colorFilter:
                  ColorFilter.mode(Colors.black54, BlendMode.darken),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
