import 'package:flutter/material.dart';

class AssetPath {
  static const String candyLogo = 'assets/candy.png';
  static const String plantLogo = 'assets/plant.png';
  static const String waterLogo = 'assets/water.png';
  static const String sunsetLogo = 'assets/sunset.png';
  static const String vintageLogo = 'assets/vintage.png';
}

class ThemeLogo extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;

  const ThemeLogo({
    required this.path,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width ?? 100.0,
      height: height ?? 100.0,
    );
  }
}
