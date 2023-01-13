import 'dart:html';

import 'package:flutter/material.dart';

import 'package:simple_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:simple_state_management/presentation_layer/utils/app_icons.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return PageDecoration(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO implement items search
          // TextFormField(),
          // SizedBox(height: Spacing.medium),
          const Text('TRENDING PRODUCTS'),
          SizedBox(height: Spacing.medium),
          SizedBox(
            height: ScreenSize.height * 0.3,
            width: ScreenSize.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Image.asset(AppIconPath.item);
              },
            ),
          ),
          SizedBox(height: Spacing.medium),
          const Text('POPULAR CATEGORIES'),
          SizedBox(height: Spacing.medium),
          const Text('POPULAR CATEGORIES'),
          SizedBox(height: Spacing.medium),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Image.asset(AppIconPath.item);
              },
            ),
          ),
          const Text('POPULAR CATEGORIES'),
          SizedBox(height: Spacing.medium),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Image.asset(AppIconPath.item);
              },
            ),
          ),
        ],
      ),
    );
  }
}
