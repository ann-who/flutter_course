import 'package:catch_error/fetch_file.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  Future<String>? _screenText;

  @override
  void initState() {
    super.initState();
    _screenText = fetchFileFromAssets('assets/data.txt');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catch error'),
      ),
      body: FutureBuilder<String>(
        future: _screenText,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text('NONE'));
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                print(snapshot.error);
                return const Center(child: Text('File not found'));
              }
              return SingleChildScrollView(child: Text(snapshot.data));
            default:
              return SingleChildScrollView(child: Text('Default'));
          }
        },
      ),
    );
  }
}
