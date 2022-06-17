import 'package:flutter/material.dart';

import 'package:hero_card/app_constants.dart';
import 'package:hero_card/screens/details_screen.dart';
import 'package:hero_card/space.dart';
import 'package:hero_card/widgets/space_card.dart';

class HomeView extends StatefulWidget {
  HomeView({
    Key? key,
    required this.title,
    this.spaces,
  }) : super(key: key);

  final String title;
  final List<Space>? spaces;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WidgetSettings.appBarBackgroundColor,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: spaces.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: WidgetSettings.screenPadding),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      details: spaces[index],
                    ),
                  ),
                );
              },
              child: SpaceCard(space: spaces[index]),
            ),
          );
        },
      ),
    );
  }
}
