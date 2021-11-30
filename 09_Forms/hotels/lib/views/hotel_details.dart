import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:http/http.dart' as http;

class HotelDetailsInfo extends StatefulWidget {
  HotelDetailsInfo({Key? key}) : super(key: key);

  @override
  _HotelDetailsInfoState createState() => _HotelDetailsInfoState();
}

class _HotelDetailsInfoState extends State<HotelDetailsInfo> {
  bool isLoading = false;
  bool hasError = false;
  Hotel? detailsInfo;
  List<Hotel> hotels = [];

  void initState() {
    super.initState();
  }

  void getData(String uuid) async {
    setState(() {
      isLoading = true;
    });
    try {
      final response =
          await http.get(Uri.parse('https://run.mocky.io/v3/$uuid'));

      var data = json.decode(response.body) as Map<String, dynamic>;
      detailsInfo = Hotel.fromJson(data);
    } catch (err) {
      hasError = true;
      print(404);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final hotelUuid = ModalRoute.of(context)!.settings.arguments as String;

    if (!isLoading && !hasError && detailsInfo == null) getData(hotelUuid);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(detailsInfo?.name ?? ''),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? Center(
                  child: Text('Контент временно недоступен'),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CarouselSlider(
                        items: detailsInfo!.photos!
                            .map(
                              (item) => Container(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/$item',
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (detailsInfo!.address?.country != null)
                            Row(
                              children: [
                                Text('Страна:'),
                                Text(
                                  ' ${detailsInfo!.address!.country}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          if (detailsInfo!.address?.city != null)
                            Row(
                              children: [
                                Text('Город:'),
                                Text(
                                  ' ${detailsInfo!.address!.city}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          if (detailsInfo!.address?.street != null)
                            Row(
                              children: [
                                Text('Улица:'),
                                Text(
                                  ' ${detailsInfo!.address!.street}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          Row(
                            children: [
                              Text('Рейтинг:'),
                              Text(
                                ' ${detailsInfo!.rating.toString()}',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Column(
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
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                    Text(
                                        '\n${detailsInfo!.services!.paid!.join('\n')}'),
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
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                    Text(
                                        '\n${detailsInfo!.services!.free!.join('\n')}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
    );
  }
}
