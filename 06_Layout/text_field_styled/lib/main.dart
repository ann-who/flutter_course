import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        hintColor: Colors.grey[500],
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: AppResources.searchFieldTextStyleColor,
          suffixIconColor: AppResources.borderColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppResources.borderColor,
              width: AppResources.borderWidth,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppResources.borderRadius),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppResources.borderColor,
              width: AppResources.borderWidth,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppResources.borderRadius),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppResources.borderColor,
              width: AppResources.borderWidth,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppResources.borderRadius),
            ),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppResources.borderColor,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text field styled'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Введите значение',
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                  helperText: 'Поле для поиска заметок',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppResources {
  static const Color borderColor = Colors.purple;
  static const TextStyle searchFieldTextStyleColor =
      TextStyle(color: Colors.purple);

  static const double borderWidth = 2.0;
  static const double borderRadius = 18.0;
}
