import 'package:flutter/material.dart';
// import 'string_extension.dart';
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
            break;
          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return NotFound();
            });
        }
      },
    );
  }
}

class AppColors {
  static final Color canvaColor = Color(0xffdfe7fd);
  static final Color accentColor = Color(0xff457b9d);
  static final Color cardColor = Color(0xffa8dadc);
  static final Color textColor = Color(0xff001219);
}

class Artist {
  final String name;
  final String link;
  final String about;

  Artist(this.name, this.link, this.about);

  Artist.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        link = json['link'],
        about = json['about'];

  String get normalizedName {
    List<String> bandName = name.split(' ');
    List<String> capitalizedBandName = bandName.map((String word) {
      String trimmedWord = word.trim();
      if (trimmedWord.isEmpty) {
        return '';
      }

      final String firstLetter = trimmedWord.substring(0, 1).toUpperCase();
      final String remainingLetters = trimmedWord.substring(1);
      return '$firstLetter$remainingLetters';
    }).toList();

    return capitalizedBandName.join(' ');
  }
}
