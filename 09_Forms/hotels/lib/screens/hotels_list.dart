import 'package:flutter/material.dart';
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
            return Card(
              child: Column(
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: Image(
                        image: AssetImage('assets/images/${hotel.poster}'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
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
