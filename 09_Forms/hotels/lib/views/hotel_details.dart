import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotels/components/address_raiting.dart';
import 'package:hotels/components/services.dart';
import 'package:hotels/components/slides.dart';
import 'package:hotels/models/hotel.dart';
import 'package:http/http.dart' as http;

class HotelDetailsInfo extends StatefulWidget {
  HotelDetailsInfo({Key? key}) : super(key: key);

  @override
  _HotelDetailsInfoState createState() => _HotelDetailsInfoState();
}

class _HotelDetailsInfoState extends State<HotelDetailsInfo> {
  Hotel? detailsInfo;
  Future<Hotel>? _hotelDetailsFuture;

  void initState() {
    super.initState();
  }

  Future<Hotel> getHotelDetails(String uuid) async {
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/$uuid'));
    if (response.statusCode != HttpStatus.ok) {
      return Future.error('Контент временно недоступен');
    }
    var data = json.decode(response.body) as Map<String, dynamic>;
    var detailsInfo = Hotel.fromJson(data);
    return detailsInfo;
  }

  @override
  Widget build(BuildContext context) {
    final hotelUuid = ModalRoute.of(context)!.settings.arguments as String;
    _hotelDetailsFuture = getHotelDetails(hotelUuid);

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
      body: FutureBuilder(
        future: _hotelDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final detailsInfo = snapshot.data as Hotel;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Slides(detailsInfo.photos),
                  const SizedBox(height: 10.0),
                  AddressAndRaiting(detailsInfo.address, detailsInfo.rating),
                  const SizedBox(height: 30.0),
                  HotelServices(
                    detailsInfo.services,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
