import 'package:flutter/material.dart';

import 'package:simple_state_management/presentation_layer/utils/app_decorations.dart';
import 'package:simple_state_management/presentation_layer/utils/app_icons.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecoration(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(),
          const SizedBox(height: 16.0),
          Text('TRENDING PRODUCTS'),
          const SizedBox(height: 16.0),
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
          const SizedBox(height: 16.0),
          Text('POPULAR CATEGORIES'),
          const SizedBox(height: 16.0),
          Text('POPULAR CATEGORIES'),
          const SizedBox(height: 16.0),
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
          Text('POPULAR CATEGORIES'),
          const SizedBox(height: 16.0),
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
