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
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final searchFieldStyle = TextStyle(color: Colors.purple[400]);

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
            Theme(
              data: ThemeData(
                primaryColor: Colors.purple[400],
                hintColor: Colors.grey[500],
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.purple[400], width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(18.0)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(18.0)),
                    ),
                    labelText: 'Search',
                    hintText: 'Введите значение',
                    suffixIcon: Icon(
                      Icons.search,
                    ),
                    helperText: 'Поле для поиска заметок',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
