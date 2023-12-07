import 'package:flutter/material.dart';
import 'package:task_3/data_source/local_data_source.dart';
import 'package:task_3/utils/app_images.dart';

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
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var contacts = LocalDataSource().getContacts().keys.toList();
  var avatars = LocalDataSource().getContacts().values.toList();
  String getEmail(String name) {
    var base = name.toLowerCase().replaceAll(' ', '');
    var email = '$base@gmail.com';

    return email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (context, index) => Card(
          child: Row(
            children: [
              AppAvatar(path: avatars[index]),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  children: [
                    Text(contacts[index]),
                    Text(getEmail(contacts[index])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
