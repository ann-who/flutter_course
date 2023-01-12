import 'package:flutter/material.dart';

import 'package:hotels/models/hotel.dart';

class HotelServices extends StatelessWidget {
  final Services? services;

  const HotelServices(this.services, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Сервисы',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 10.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Платные',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text('\n${services!.paid!.join('\n')}'),
                  ],
                ),
              ),
              SizedBox(width: 30.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Бесплатные',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text('\n${services!.free!.join('\n')}'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
