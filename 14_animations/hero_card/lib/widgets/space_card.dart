import 'package:flutter/material.dart';
import 'package:hero_card/app_constants.dart';
import 'package:hero_card/space.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  const SpaceCard({required this.space, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardHeight = MediaQuery.of(context).size.height / 4;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(WidgetSettings.cardRadius),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: cardHeight,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: space.id,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              space.image,
                            ),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(WidgetSettings.cardPadding),
                    color: WidgetSettings.cardBackgroundColor,
                    child: Hero(
                      tag: '${space.id}-title',
                      child: Material(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: WidgetSettings.cardBackgroundColor,
                            border: Border.all(
                              width: WidgetSettings.borderWidth,
                              color: WidgetSettings.cardBackgroundColor,
                            ),
                          ),
                          child: Text(
                            space.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 20,
              bottom: cardHeight / 2 - WidgetSettings.cardButtonSize / 2,
              child: Hero(
                tag: '${space.id}-button',
                child: Container(
                  height: WidgetSettings.cardButtonSize,
                  width: WidgetSettings.cardButtonSize,
                  color: WidgetSettings.buttonColorOnList,
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
