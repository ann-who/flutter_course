import 'package:flutter/material.dart';

import 'package:hotels/models/hotel.dart';

class AddressAndRaiting extends StatelessWidget {
  final Address? address;
  final double? rating;

  const AddressAndRaiting(this.address, this.rating, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text('Страна:'),
              Text(
                ' ${address!.country}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          Row(
            children: [
              Text('Город:'),
              Text(
                ' ${address!.city}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          Row(
            children: [
              Text('Улица:'),
              Text(
                ' ${address!.street}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          Row(
            children: [
              Text('Рейтинг:'),
              Text(
                ' ${rating.toString()}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
