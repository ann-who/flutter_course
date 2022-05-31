import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/resources/theme.dart';

class HotelGridCard extends StatelessWidget {
  final Hotel hotel;
  const HotelGridCard({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            width: double.maxFinite,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppConstants.cardRadius),
                topRight: Radius.circular(AppConstants.cardRadius),
              ),
              child: Image(
                image: AssetImage('assets/images/${hotel.poster}'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Spacer(),
          Text(hotel.name, textAlign: TextAlign.center),
          Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(
                  200,
                  50,
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/detailsInfo',
                arguments: hotel.uuid,
              );
            },
            child: Text('Подробнее'),
          ),
        ],
      ),
    );
  }
}

class HotelListCard extends StatelessWidget {
  final Hotel hotel;
  const HotelListCard({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
