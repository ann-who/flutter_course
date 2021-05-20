import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  LeftDrawer();

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/user.jpg'),
            ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Home tapped!');
            },
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person_outline),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Profile tapped!');
            },
          ),
          ListTile(
            title: Text('Images'),
            leading: Icon(Icons.image),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Images tapped!');
            },
          ),
          Expanded(
            child: SafeArea(
              minimum: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Выход',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xfffcd5ce),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Регистрация',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xfffcd5ce),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RightDrawer extends StatelessWidget {
  RightDrawer();

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/user.jpg'),
            ),
          ),
          Text('Name Lastname'),
        ],
      ),
    );
  }
}
