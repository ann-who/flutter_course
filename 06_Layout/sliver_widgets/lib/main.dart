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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Page title'),
              centerTitle: false,
              background: Image.asset(
                'assets/appbar.jpg',
                fit: BoxFit.cover,
                color: Colors.black45,
                colorBlendMode: BlendMode.colorBurn,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras feugiat ipsum et ligula tristique, ut condimentum velit lacinia. Aliquam erat volutpat. Suspendisse fermentum elit sit amet orci molestie aliquam. Quisque ultrices ex nibh, sed sollicitudin ex aliquam vitae. Donec at feugiat sem. Cras blandit luctus erat, eu facilisis arcu aliquet eu. Proin dictum vehicula orci, vitae tincidunt ligula egestas eu. Duis eu dignissim ex, non cursus nisl. Aenean pulvinar libero non massa feugiat eleifend ut nec metus. Vivamus tempus tristique lacinia. Pellentesque maximus arcu ante, eu facilisis quam malesuada at. Duis bibendum semper libero in sagittis. \nInteger eget nisl eros. Aliquam lorem turpis, vestibulum varius orci sed, lacinia volutpat augue. Nunc eu urna non urna tempor porttitor. Sed pellentesque leo est. Aenean ultricies turpis dolor. Mauris convallis purus nulla, at fringilla justo blandit congue. Etiam vulputate vehicula sem, sed varius augue tincidunt vel. Maecenas viverra bibendum felis. Maecenas quis tempor nisi. Donec gravida, lectus ut condimentum posuere, justo erat vestibulum ligula, ut ultricies nisi libero eget ex. Curabitur venenatis mi et tincidunt sagittis. Phasellus pulvinar lacinia blandit. Morbi accumsan felis id nisl dignissim, ut tristique leo blandit. Aliquam id condimentum lectus, at molestie lacus. \nDonec nulla tellus, suscipit pulvinar nunc eleifend, lobortis mollis lectus. Phasellus eget lorem vel quam imperdiet convallis. Aliquam dignissim ligula luctus enim finibus, non eleifend tellus sollicitudin. Nullam vestibulum nibh at neque tempor, sed elementum nulla fringilla. In in venenatis ipsum, sed efficitur diam. Proin luctus malesuada lectus, ut eleifend erat maximus in. Nunc varius quis enim eu placerat. Sed nec elit vitae nisl volutpat lacinia et a mi. Morbi quis arcu eu ligula interdum sagittis.'),
          ),
        ],
      ),
    );
  }
}
