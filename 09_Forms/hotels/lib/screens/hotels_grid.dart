import 'package:flutter/material.dart';
import 'package:hotels/components/hotel_card.dart';
import 'package:hotels/models/hotel.dart';

class HotelsGridView extends StatelessWidget {
  final List<Hotel> hotels;

  HotelsGridView(this.hotels, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      children: <Widget>[
        ...hotels.map((hotel) {
          return HotelGridCard(hotel: hotel);
        }).toList(),
      ],
    );
  }
}
