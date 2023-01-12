import 'package:flutter/material.dart';

class PageDecoration extends StatelessWidget {
  final Widget child;

  const PageDecoration({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenSize {
  static double width = 1.0;
  static double height = 1.0;

  void init(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;
  }
}

class Spacing {
  static double medium = 16.0;
  static double height = 1.0;
}

abstract class AppText {
  static const TextStyle header1 = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle header2 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w300,
  );
}
