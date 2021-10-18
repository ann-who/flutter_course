import 'dart:convert';

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

  void initState() {
    super.initState();
  }

  void getData(String uuid) async {
    setState(() {
      isLoading = true;
    });
    try {
      final response =
          await http.get(Uri.parse('https://run.mocky.io/v3/${uuid}'));
      var data = json.decode(response.body) as Map<String, dynamic>;
      detailsInfo = Hotel.fromJson(data);
    } catch (err) {
      hasError = true;
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
              ? Text('Контент временно недоступен')
              : Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Image(
                        image:
                            AssetImage('assets/images/${detailsInfo?.poster}'),
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(height: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          if (detailsInfo!.address?.country != null)
                            Text('Страна: ${detailsInfo!.address!.country}'),
                          if (detailsInfo!.address?.city != null)
                            Text('Город: ${detailsInfo!.address!.city}'),
                          if (detailsInfo!.address?.street != null)
                            Text('Улица: ${detailsInfo!.address!.street}'),
                          Text('Рейтинг: ${detailsInfo?.rating.toString()}'),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Column(
                        children: <Widget>[
                          Text('Сервисы'),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                        'Платные: \n${detailsInfo!.services!.paid}'),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    Text(
                                        'Бесплатные: \n${detailsInfo!.services!.free}'),
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
