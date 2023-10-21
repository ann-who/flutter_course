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
        child: Padding(
          padding: EdgeInsets.only(
            top: Spacing.medium,
            left: Spacing.medium,
            right: Spacing.medium,
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: Spacing.big),
                    child: child,
                  ),
                ),
              ],
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
  static double big = 32.0;
  static double medium = 16.0;
  static double small = 8.0;
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

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w300,
  );
}
