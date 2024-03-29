import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hooks_riverpod_state_management/presentation_layer/cart/cart_page.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/catalog/catalog_page.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/orders/orders_page.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_colors.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_icons.dart';
import 'package:hooks_riverpod_state_management/presentation_layer/utils/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: AppColors.secondaryPink,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.primaryPink,
            elevation: 0.0,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  static const List<Widget> pages = <Widget>[
    OrdersPage(),
    CatalogPage(),
    CartPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPink,
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: AppIcon(path: AppIconPath.orderIcon),
            label: AppString.orders,
          ),
          BottomNavigationBarItem(
            icon: AppIcon(path: AppIconPath.catalogIcon),
            label: AppString.catalog,
          ),
          BottomNavigationBarItem(
            icon: AppIcon(path: AppIconPath.cartIcon),
            label: AppString.cart,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
