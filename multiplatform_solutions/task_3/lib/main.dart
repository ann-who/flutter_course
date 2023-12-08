import 'package:flutter/material.dart';

import 'package:task_3/ui_layer/contacts_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
        cardTheme: CardTheme(
          elevation: 4.0,
          margin: const EdgeInsets.only(bottom: 16.0),
          shadowColor: Colors.orangeAccent.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      home: ContactsPage(),
    );
  }
}
