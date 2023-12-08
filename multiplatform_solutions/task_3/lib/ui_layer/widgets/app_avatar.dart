import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;

  const AppAvatar({
    required this.path,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.horizontal(left: Radius.circular(30.0)),
      child: Image.asset(
        path,
        width: width ?? 150.0,
        height: height ?? 150.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
