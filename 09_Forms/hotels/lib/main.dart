import 'package:flutter/material.dart';
import 'package:hotels/resources/theme.dart';
import 'package:hotels/views/home_view.dart';
import 'package:hotels/views/hotel_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotels',
      theme: ThemeManager.hotelsTheme(),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomeView(),
        '/detailsInfo': (BuildContext context) => HotelDetailsInfo(),
      },
    );
  }
}
