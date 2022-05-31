import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/resources/theme.dart';

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
            return Card(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppConstants.cardRadius),
                      topRight: Radius.circular(AppConstants.cardRadius),
                    ),
                    child: Image(
                      image: AssetImage('assets/images/${hotel.poster}'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppConstants.textPadding,
                        right: AppConstants.textPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(hotel.name),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/detailsInfo',
                              arguments: hotel.uuid,
                            );
                          },
                          child: Text('Подробнее'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
