import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconPath {
  static const String cartIcon = 'assets/cart.svg';
  static const String homeIcon = 'assets/home.svg';
  static const String catalogIcon = 'assets/catalog.svg';
  static const String orderIcon = 'assets/order.svg';
  static const String filterIcon = 'assets/filter.svg';
  static const String searchIcon = 'assets/search.svg';
  static const String addIcon = 'assets/add.svg';
  static const String removeIcon = 'assets/remove.svg';
}

class AppIcon extends StatelessWidget {
  final String path;
  final Color? color;
  final double? width;
  final double? height;

  const AppIcon({
    required this.path,
    this.color,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      color: color ?? Colors.white,
      width: width ?? 24.0,
      height: height ?? 24.0,
    );
  }
}
