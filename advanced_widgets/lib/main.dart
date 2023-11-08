import 'dart:math';

import 'package:advanced_widgets/pages/change_weather_page/change_weather_page.dart';
import 'package:advanced_widgets/pages/current_weather_info_page/current_weather_info_page.dart';
import 'package:advanced_widgets/theme_data.dart';
import 'package:advanced_widgets/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();
  late int randomNumber;
  late ThemeData currentThemeData;

  Map<String, ThemeData> themes = {
    'Candy': CustomTheme().candyTheme,
    'Plant': CustomTheme().plantTheme,
    'Water': CustomTheme().waterTheme,
    'Sunset': CustomTheme().sunsetTheme,
    'Vintage': CustomTheme().vintageTheme,
  };

  Map<ThemeData, ThemeLogo> themeLogo = {
    CustomTheme().candyTheme: const ThemeLogo(path: AssetPath.candyLogo),
    CustomTheme().plantTheme: const ThemeLogo(path: AssetPath.plantLogo),
    CustomTheme().waterTheme: const ThemeLogo(path: AssetPath.waterLogo),
    CustomTheme().sunsetTheme: const ThemeLogo(path: AssetPath.sunsetLogo),
    CustomTheme().vintageTheme: const ThemeLogo(path: AssetPath.vintageLogo),
  };

  @override
  void initState() {
    randomNumber = random.nextInt(4);
    currentThemeData = themes.values.toList()[randomNumber];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var currentLogo = themeLogo.entries
        .where((theme) => theme.key == currentThemeData)
        .first
        .value;

    return Theme(
      data: currentThemeData,
      child: Builder(
        builder: (context) => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Advanced Widgets',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            drawer: ThemeDrawer(
              currentThemeData: currentThemeData,
              currentLogo: currentLogo,
              themes: themes,
              onSelect: (index) => setState(
                () => currentThemeData = themes.values.toList()[index],
              ),
            ),
            body: MainPageBody(currentThemeData: currentThemeData),
          ),
        ),
      ),
    );
  }
}

class MainPageBody extends StatelessWidget {
  const MainPageBody({
    super.key,
    required ThemeData currentThemeData,
  }) : _currentThemeData = currentThemeData;

  final ThemeData _currentThemeData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20.0),
          Text(
            'Here are the rest of the task. Click on the correspondent button to see it.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20.0),
          MainButton(
            currentThemeData: _currentThemeData,
            title: 'Change weather',
            child: const ChangeWeatherPage(),
          ),
          const SizedBox(height: 20.0),
          MainButton(
            currentThemeData: _currentThemeData,
            title: 'Weather info',
            child: const CurrentWeatherInfoPage(),
          ),
        ],
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.currentThemeData,
    required this.child,
    required this.title,
  });

  final ThemeData currentThemeData;
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 80,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Theme(
                data: currentThemeData,
                child: child,
              ),
            ),
          );
        },
        child: Text(title),
      ),
    );
  }
}

class ThemeDrawer extends StatelessWidget {
  const ThemeDrawer({
    super.key,
    required this.currentThemeData,
    required this.currentLogo,
    required this.themes,
    required this.onSelect,
  });

  final ThemeData currentThemeData;
  final ThemeLogo currentLogo;
  final Map<String, ThemeData> themes;
  final Function(int index) onSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          currentLogo,
          Text(
            'Pick your theme here:',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: themes.keys.length,
            itemBuilder: (context, index) => ListTile(
              trailing: themes.values.toList()[index] == currentThemeData
                  ? const Icon(Icons.check)
                  : const SizedBox.shrink(),
              title: Text(themes.keys.toList()[index]),
              onTap: () => onSelect(index),
            ),
          ),
        ],
      ),
    );
  }
}
