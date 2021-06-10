import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';
import 'drawer.dart';

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
        primaryColor: AppColor.primaryColor,
        canvasColor: AppColor.accentColor,
      ),
      routes: {
        AppRoutes.mainPage: (context) => MainScreen(),
        AppRoutes.homePage: (context) => HomePage(),
        AppRoutes.artistPage: (context) => ArtistPage(),
      },
      // navigatorObservers: [routeObserver],
    );
  }
}

class AppRoutes {
  static final mainPage = '/';
  static final homePage = '/home';
  static final artistPage = '/artist';
}

class AppColor extends Color {
  AppColor(int value) : super(value);
  static final AppColor primaryColor = AppColor(0xff706677);
  static final AppColor accentColor = AppColor(0xffd6cfcb);
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Navigation',
            ),
          ],
        ),
      ),
      drawer: NavDrawer(),
    );
  }
}
