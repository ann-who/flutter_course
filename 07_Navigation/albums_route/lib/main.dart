import 'package:flutter/material.dart';

import 'package:albums_route/app_resources.dart';
import 'package:albums_route/artist_model.dart';
import 'pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.accentColor,
        canvasColor: AppColors.canvaColor,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: AppColors.textColor,
            fontFamily: 'Montserrat',
            fontSize: 16,
          ),
        ),
        cardTheme: CardTheme(
          color: AppColors.canvaColor,
          elevation: 0,
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MainPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return MainPage();
            });
          case ArtistPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return ArtistPage();
            });
          case AboutPage.routeName:
            final artist = settings.arguments as Artist;
            return MaterialPageRoute(builder: (BuildContext context) {
              return AboutPage(artist);
            });

          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return NotFound();
            });
        }
      },
    );
  }
}
