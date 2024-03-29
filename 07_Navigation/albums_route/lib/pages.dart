import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:albums_route/app_resources.dart';
import 'package:albums_route/artist_model.dart';
import 'drawer.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      drawer: NavDrawer(MainPage.routeName),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Card(
            color: AppColors.canvaColor,
            elevation: 0,
            margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Text(
              AppTexts.homePageText,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}

class ArtistPage extends StatefulWidget {
  static const routeName = '/artist';

  Future<List<Artist>>? artistsFuture;

  Future<List<Artist>> fetchArtistsFromAssets(String assetsPath) async {
    final rawJson = await rootBundle.loadString(assetsPath);
    final parsedJson = jsonDecode(rawJson);

    List<Artist> artists = [];
    for (var jsonArtist in parsedJson) {
      artists.add(Artist.fromJson(jsonArtist));
    }
    return artists;
  }

  @override
  _ArtistPageState createState() {
    artistsFuture = fetchArtistsFromAssets('assets/artists.json');
    return _ArtistPageState();
  }
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artists\' page'),
      ),
      drawer: NavDrawer(ArtistPage.routeName),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: widget.artistsFuture,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Container();
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var artist = snapshot.data[index] as Artist;
                      return Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: ListTile(
                            tileColor: AppColors.cardColor,
                            title: Text(artist.normalizedName),
                            onTap: () {
                              Navigator.pushNamed(context, AboutPage.routeName,
                                  arguments: artist);
                            },
                          ),
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

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red[200],
        child: Text('404 not found'),
      ),
    );
  }
}

class AboutPage extends StatefulWidget {
  static const routeName = '/about';
  final Artist artist;

  AboutPage(this.artist);

  @override
  AboutPageState createState() {
    return AboutPageState();
  }
}

class AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.artist.normalizedName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(15),
          child: Text(
            '${widget.artist.about}',
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
