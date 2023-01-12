import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:hotels/models/hotel.dart';
import 'package:hotels/screens/hotels_grid.dart';
import 'package:hotels/screens/hotels_list.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isListView = true;
  Future<List<Hotel>>? _hotelsFuture;

  @override
  void initState() {
    super.initState();
    _hotelsFuture = getHotels();
  }

  Future<List<Hotel>> getHotels() async {
    var response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301'));
    if (response.statusCode != HttpStatus.ok) {
      return Future.error('Не удалось получить список отелей');
    }
    var data = json.decode(response.body) as List;
    var hotels = (data.map<Hotel>((hotel) => Hotel.fromJson(hotel))).toList();
    return hotels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isListView = true;
                });
              },
              icon: Icon(Icons.list)),
          IconButton(
              onPressed: () {
                setState(() {
                  isListView = false;
                });
              },
              icon: Icon(Icons.grid_view)),
        ],
      ),
      body: FutureBuilder(
        future: _hotelsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final hotels = snapshot.data as List<Hotel>;
            return isListView ? HotelsListView(hotels) : HotelsGridView(hotels);
          } else if (snapshot.hasError) {
            print('${snapshot.error}');
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
