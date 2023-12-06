import 'package:flutter/material.dart';

import 'package:task_2/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          hintStyle: TextStyle(color: Colors.black38),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            gapPadding: 0.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            gapPadding: 0.0,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
