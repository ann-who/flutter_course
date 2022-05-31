import 'package:flutter/material.dart';
import 'package:hotels/components/hotel_card.dart';
import 'package:hotels/models/hotel.dart';

class HotelsListView extends StatelessWidget {
  final List<Hotel> hotels;

  HotelsListView(this.hotels, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ...hotels.map((hotel) {
            return HotelListCard(hotel: hotel);
          }).toList(),
        ],
      ),
    );
  }
}
