import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class Slides extends StatelessWidget {
  final List<String>? photos;

  const Slides(this.photos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: photos!
          .map(
            (item) => Container(
              child: Image(
                image: AssetImage(
                  'assets/images/$item',
                ),
                fit: BoxFit.fitWidth,
              ),
              margin: EdgeInsets.symmetric(horizontal: 5.0),
            ),
          )
          .toList(),
      options: CarouselOptions(
        aspectRatio: 2.0,
        disableCenter: true,
      ),
    );
  }
}
