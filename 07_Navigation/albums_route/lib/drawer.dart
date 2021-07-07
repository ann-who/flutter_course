import 'package:albums_route/pages.dart';
import 'package:flutter/material.dart';
// import 'main.dart';

//ignore: must_be_immutable
class NavDrawer extends StatelessWidget {
  String _activeRoute;

  NavDrawer(this._activeRoute);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                'assets/user.jpg',
              ),
            ),
            accountName: Text('FirstName LastName'),
            accountEmail: Text('useraccount@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            selected: _activeRoute == MainPage.routeName,
            onTap: () {
              Navigator.pushReplacementNamed(context, MainPage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Artists'),
            selected: _activeRoute == ArtistPage.routeName,
            onTap: () {
              Navigator.pushReplacementNamed(context, ArtistPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
