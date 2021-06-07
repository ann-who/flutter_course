import 'package:flutter/material.dart';
import 'main.dart';

//ignore: must_be_immutable
class NavDrawer extends StatelessWidget {
  // const NavDrawer({ Key? key }) : super(key: key);
  String _activeRoute;
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
            selected: _activeRoute == AppRoutes.homePage,
            onTap: () {
              _activeRoute = AppRoutes.homePage;
              Navigator.pushNamed(context, AppRoutes.homePage);
            },
          ),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Artists'),
            selected: _activeRoute == AppRoutes.artistPage,
            onTap: () {
              _activeRoute = AppRoutes.artistPage;
              Navigator.pushNamed(context, AppRoutes.artistPage);
            },
          ),
        ],
      ),
    );
  }
}
