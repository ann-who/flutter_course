import 'package:flutter/material.dart';
import 'package:hero_card/app_constants.dart';
import 'package:hero_card/space.dart';

class DetailsScreen extends StatelessWidget {
  final Space details;
  const DetailsScreen({required this.details, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WidgetSettings.appBarBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Hero(
                  tag: details.id,
                  child: Image.asset(details.image),
                ),
                Positioned(
                  right: 20,
                  bottom: -20,
                  child: Hero(
                    tag: '${details.id}-button',
                    child: Container(
                      height: WidgetSettings.cardButtonSize,
                      width: WidgetSettings.cardButtonSize,
                      color: WidgetSettings.buttonColorOnDetail,
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
            Hero(
              tag: '${details.id}-title',
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: WidgetSettings.screenPadding,
                    vertical: WidgetSettings.screenExtraPadding),
                child: Material(
                  child: Text(
                    details.description,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
