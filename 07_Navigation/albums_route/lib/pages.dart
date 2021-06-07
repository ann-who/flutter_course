import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        leading: Icon(Icons.arrow_back),
      ),
      body: Text('hduwahduhwefw'),
    );
  }
}

class Artist {
  final String name;
  final String link;
  final String about;

  Artist(this.name, this.link, this.about);

  // factory Artist.fromJSON(
  //   Map<String, dynamic> json,
  // ) {
  //   return Artist(json['name'] as String, json['link'] as String,
  //       json['about'] as String);
  // }
}

class ArtistPage extends StatefulWidget {
  final ArtistPageController controller;
  const ArtistPage({Key key, this.controller}) : super(key: key);

  _ArtistPageState createState() {
    return _ArtistPageState();
  }
}

class _ArtistPageState extends State<ArtistPage> {
  // List<Artists> artists;
  // void _getArtists() async {
  //   var newArtist = await widget.controller.fetchArtists();
  //   setState(() {
  //     artists = newArtist;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artists\' page'),
        leading: Icon(Icons.arrow_back),
      ),
      body: ListView(),
    );
  }
}
