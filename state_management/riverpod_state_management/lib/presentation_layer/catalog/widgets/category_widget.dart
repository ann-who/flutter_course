import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String title;

  const CategoryWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
