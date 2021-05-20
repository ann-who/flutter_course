import 'package:flutter/material.dart';
import 'package:simple_app/drawers.dart';

void main() {
  runApp(MyApp());
}

class TabItem {
  String title;
  Icon icon;
  TabItem({this.title, this.icon});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffd8e2dc),
        canvasColor: Color(0xffe8e8e4),
        accentColor: Color(0xfffcd5ce),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List<TabItem> _tabBar = [
    TabItem(icon: Icon(Icons.home), title: 'Photos'),
    TabItem(icon: Icon(Icons.chat), title: 'Chat'),
    TabItem(icon: Icon(Icons.album), title: 'Albums'),
  ];
  PersistentBottomSheetController _controller;
  TabController _tabController;
  int _currentTabIndex = 0;

  void openBottomSheet() {
    if (_controller == null) {
      showModalBottomSheet<void>(
        context: context,
        builder: (context) => Container(
          height: 200,
          color: Color(0xfff8edeb),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(Icons.payment),
                    SizedBox(width: 10),
                    Text('Сумма'),
                    Spacer(),
                    Text('200 руб')
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Оплатить',
                  style: TextStyle(color: Colors.black),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xfffcd5ce),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      _controller.close();
      _controller = null;
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      print('Listener: ${_tabController.index}');
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                }),
          ),
        ],
      ),
      drawer: LeftDrawer(),
      endDrawer: RightDrawer(),
      body: TabBarView(controller: _tabController, children: [
        Container(
          child: Image.asset('assets/images/photos.png'),
        ),
        Container(
          child: Image.asset('assets/images/chat.png'),
        ),
        Container(
          child: Image.asset('assets/images/albums.png'),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
        items: [
          for (final item in _tabBar)
            BottomNavigationBarItem(
              label: item.title,
              icon: item.icon,
            )
        ],
        backgroundColor: Color(0xffd8e2dc),
        selectedItemColor: Color(0xff457b9d),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: openBottomSheet,
      ),
    );
  }
}
