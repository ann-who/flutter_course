import 'package:flutter/material.dart';
import 'package:simple_app/resources/app_constants.dart';
import 'package:simple_app/resources/app_images.dart';
import 'package:simple_app/widgets/buttons.dart';

class LeftDrawer extends StatelessWidget {
  LeftDrawer();

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: CircleAvatar(
              radius: WidgetsSettings.avatarRadius,
              backgroundImage: AssetImage(AppImages.user),
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
              minimum: EdgeInsets.all(WidgetsSettings.padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppTextButton(title: 'Выход'),
                  AppTextButton(title: 'Регистрация')
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
              radius: WidgetsSettings.avatarRadius,
              backgroundImage: AssetImage(AppImages.user),
            ),
          ),
          Text('Name Lastname'),
        ],
      ),
    );
  }
}
