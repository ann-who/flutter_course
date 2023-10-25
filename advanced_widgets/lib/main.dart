import 'package:advanced_widgets/theme_data.dart';
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
  var _currentThemeData = CustomTheme().candyTheme;

  Map<String, ThemeData> profiles = {
    'Candy': CustomTheme().candyTheme,
    'Plant': CustomTheme().plantTheme,
    'Water': CustomTheme().waterTheme,
    'Sunset': CustomTheme().sunsetTheme,
    'Vintage': CustomTheme().vintageTheme,
  };

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _currentThemeData,
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Advanced Widgets',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Text(
                  'Pick your theme here:',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: profiles.keys.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(profiles.keys.toList()[index]),
                    onTap: () => setState(
                      () {
                        _currentThemeData = profiles.values.toList()[index];
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
                Text(
                  'You have pushed the button this many times:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
