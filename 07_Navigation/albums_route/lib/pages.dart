import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

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

  Artist.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        link = json['link'],
        about = json['about'];
}

class ArtistPage extends StatefulWidget {
  Future<List<Artist>> _artistsFuture;

  Future<List<Artist>> fetchArtistsFromAssets(String assetsPath) async {
    final rawJson = await rootBundle.loadString(assetsPath);
    final parsedJson = jsonDecode(rawJson);

    List<Artist> artists = [];
    for (var jsonArtist in parsedJson) {
      artists.add(Artist.fromJson(jsonArtist));
    }
    return artists;
  }

  _ArtistPageState createState() {
    _artistsFuture = fetchArtistsFromAssets('assets/artists.json');
    return _ArtistPageState(_artistsFuture);
  }
}

class _ArtistPageState extends State<ArtistPage> {
  Future<List<Artist>> _artistsFuture;

  _ArtistPageState(this._artistsFuture);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artists\' page'),
        leading: Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: _artistsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Container();
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(snapshot.data[index].name),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
