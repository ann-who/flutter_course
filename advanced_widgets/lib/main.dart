import 'dart:math';

import 'package:advanced_widgets/change_weather.dart';
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
  late ThemeData _currentThemeData;

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
    _currentThemeData = themes.values.toList()[randomNumber];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _currentThemeData,
      child: Builder(
        builder: (context) => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Advanced Widgets',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  themeLogo.entries
                      .where((element) => element.key == _currentThemeData)
                      .first
                      .value,
                  Text(
                    'Pick your theme here:',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: themes.keys.length,
                    itemBuilder: (context, index) => ListTile(
                      trailing:
                          themes.values.toList()[index] == _currentThemeData
                              ? const Icon(Icons.check)
                              : const SizedBox.shrink(),
                      title: Text(themes.keys.toList()[index]),
                      onTap: () => setState(
                        () {
                          _currentThemeData = themes.values.toList()[index];
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: Center(
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Theme(
                              data: _currentThemeData,
                              child: const ChangeWeather(),
                            ),
                          ),
                        );
                      },
                      child: const Text('Change weather'),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Theme(
                              data: _currentThemeData,
                              child: const ChangeWeather(),
                            ),
                          ),
                        );
                      },
                      child: const Text('Weather info'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
