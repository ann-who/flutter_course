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

class _MyHomePageState extends State<MyHomePage> {
  final int _maxWidth = 500;
  final int _maxHeight = 100;
  final int _itemCount = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal list'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return ListView.builder(
                  itemCount: _itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    var card = Card(
                      color: Colors.amber,
                      child: Center(child: Text('$index')),
                    );
                    return Container(
                      width: constraints.maxWidth <= _maxWidth ? 100 : 100,
                      height: constraints.maxWidth <= _maxWidth ? 100 : 100,
                      child: card,
                    );
                  },

                  // padding: constraints.maxWidth <= _maxWidth
                  //     ? EdgeInsets.only(bottom: 350)
                  //     : EdgeInsets.zero,
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
