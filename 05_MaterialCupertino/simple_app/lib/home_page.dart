import 'package:flutter/material.dart';
import 'package:simple_app/resources/app_colors.dart';
import 'package:simple_app/resources/app_images.dart';
import 'package:simple_app/widgets/drawers.dart';
import 'package:simple_app/widgets/payment_card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
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

  TabController? _tabController;
  int _currentTabIndex = 0;

  void openBottomSheet() {
    PersistentBottomSheetController? _controller;
    if (_controller == null) {
      showModalBottomSheet<void>(
        context: context,
        builder: (context) => PaymentCard(),
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
    _tabController!.addListener(() {
      print('Listener: ${_tabController!.index}');
      setState(() {
        _currentTabIndex = _tabController!.index;
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
      body: TabBarView(
        controller: _tabController,
        children: _views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _tabController!.index = index;
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
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.selectedItem,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: openBottomSheet,
      ),
    );
  }
}

class TabItem {
  String title;
  Icon icon;

  TabItem({required this.title, required this.icon});
}

List<Widget> _views = [
  Container(child: Image.asset(AppImages.photos)),
  Container(child: Image.asset(AppImages.chat)),
  Container(child: Image.asset(AppImages.albums)),
];
