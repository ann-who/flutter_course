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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal list'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 500) {
                  return ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          tileColor: Colors.amber,
                          title: Text('$index'),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                            thickness: 5,
                          ),
                      itemCount: 30);
                } else {
                  return GridView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.amber,
                          child: Center(child: Text('$index')),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 350),
                      scrollDirection: Axis.horizontal,
                      itemCount: 30);
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
