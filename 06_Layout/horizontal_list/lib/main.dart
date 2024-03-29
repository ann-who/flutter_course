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
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _maxWidth = 500;
  final int _itemCount = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal list'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return ListView.builder(
                  itemCount: _itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: constraints.maxWidth <= _maxWidth
                            ? 100
                            : double.maxFinite,
                        height: 100,
                        child: Card(
                          color: Colors.amber,
                          child: Center(child: Text('$index')),
                        ),
                      ),
                    );
                  },
                  scrollDirection: constraints.maxWidth <= _maxWidth
                      ? Axis.horizontal
                      : Axis.vertical);
            }),
          ),
        ],
      ),
    );
  }
}
