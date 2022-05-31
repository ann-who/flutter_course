import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/resources/theme.dart';

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
        }).toList(),
      ],
    );
  }
}
